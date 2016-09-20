package ru.konstpavlov.springMVC.mvc.jdbc;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.konstpavlov.springMVC.bean.Book;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by Konstantin on 20.09.2016.
 *
 *
 */

@Controller
public class JDBCController {

    @Autowired
    JDBCExample jdbcExample;

    @RequestMapping(value = "/jdbcQueryAllBooks", method = RequestMethod.GET)
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

    @RequestMapping(value = "/book/{id}", method = RequestMethod.GET)
    public ModelAndView SelectBook(@PathVariable(value = "id") int id)
    {
        System.out.println("JDBCController jdbcSelectAllBooks() is called");
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

    @RequestMapping(value = "/jdbcDelete/book/{id}", method=RequestMethod.GET)
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
