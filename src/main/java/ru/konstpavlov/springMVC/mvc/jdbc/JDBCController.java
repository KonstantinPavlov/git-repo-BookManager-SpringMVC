package ru.konstpavlov.springMVC.mvc.jdbc;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ru.konstpavlov.springMVC.bean.Book;
import ru.konstpavlov.springMVC.mvc.file.FileUploadController;

import javax.servlet.ServletContext;
import java.io.*;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

/**
 * Created by Konstantin on 20.09.2016.
 *
 *
 */

@Controller
public class JDBCController {

    public String rootPath="";
//    System.getProperty("catalina.home")+ File.separator+"uploadFiles"+File.separator

    @Autowired
    JDBCExample jdbcExample;
    @Autowired
    ServletContext servletContext;

    @RequestMapping(value = "/jdbcSelectAllBooks", method = RequestMethod.GET)
    public ModelAndView jdbcSelectAllBooks() {
        System.out.println("JDBCController jdbcSelectAllBooks() is called");
        List<Book> books = null;
        try {
            books = jdbcExample.queryAllBooks();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return new ModelAndView("/jdbc/jdbc", "books", books);
    }

    @RequestMapping(value = "/addNew", method = RequestMethod.GET)
    public ModelAndView addNewBook() {

        return new ModelAndView("/jdbc/addNew", "", "");
    }

    public String uploaadFile(MultipartFile file)
    {

        String fileName=null;
        rootPath=servletContext.getRealPath("resources");
        // создаем папку, если ее нет
        File fileSaveDir = new File(rootPath+"\\uploadFiles\\");
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        System.out.println(fileSaveDir);

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // генерируем уникальное имя
                UUID uniqFileName = UUID.randomUUID();
                // Определеим расширение файла, экранируем точку
                String[] vals = file.getOriginalFilename().split("\\.");
                String uniqFile = uniqFileName.toString().replaceAll("-","") +"."+vals[vals.length-1];
                fileName = uniqFile;

                File newFile = new File(rootPath +File.separator+"uploadFiles"+File.separator+ fileName);
                BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(new FileOutputStream(newFile));
                bufferedOutputStream.write(bytes);
                bufferedOutputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println( "File upload is failed: " +e.getMessage());
            }
        }
        return fileName;
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public ModelAndView add (@ModelAttribute("book")Book book){

        System.out.println(book);
        // записываем файл в времменную папку
        MultipartFile file = book.getMultipartFile();
        String message=null;
        String fileName=uploaadFile(file);

        // добавляем книгу в базу
        try {
            jdbcExample.addBook(book,fileName);
            message="Книга "+book.getName()+" добавлена.";
        } catch (SQLException e) {
            e.printStackTrace();
            message="При загрузке книги произошли ошибки, попробуйте снова.";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return new ModelAndView("/jdbc/addNew", "message",message );
    }

    @RequestMapping(value = "/update/{id}",method = RequestMethod.POST)
    public ModelAndView update (@ModelAttribute("book")Book book,@PathVariable(value = "id")int id){

        // записываем файл в времменную папку
        MultipartFile file = book.getMultipartFile();
        book.setId(id);
        String message=null;
        String fileName=uploaadFile(file);

        // Обновляем книгу в базе
        try {
            jdbcExample.updateBook(book,fileName);
            message="Книга "+book.getName()+" обновлена.";
        } catch (SQLException e) {
            e.printStackTrace();
            message="При обновлении книги произошли ошибки, попробуйте снова.";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return new ModelAndView("redirect:/book/"+id);
    }

    @RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
    public ModelAndView SelectBook(@PathVariable(value = "id") int id)
    {
        System.out.println("JDBCController Select book is called");
        Book book = null;
        try {
            book = jdbcExample.getBook(id);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return new ModelAndView("/jdbc/book", "book", book);
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editBook(@PathVariable(value = "id") int id)
    {
        System.out.println("JDBCController editBook is called");
        Book book = null;
        try {
            book = jdbcExample.getBook(id);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return new ModelAndView("/jdbc/edit", "book", book);
    }

    @RequestMapping(value = "/jdbcDelete/{id}", method=RequestMethod.GET)
    public ModelAndView jdbcDelete( @PathVariable(value="id") int id) {
        System.out.println("JDBCController jdbcDelete is called");
        try {
            jdbcExample.deleteBOOK(id);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        List<Book> books = null;
        try {
            books = jdbcExample.queryAllBooks();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return new ModelAndView("/jdbc/jdbc", "books", books);
    }







}
