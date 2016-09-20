package ru.konstpavlov.springMVC.mvc.jdbc;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import org.springframework.stereotype.Repository;
import ru.konstpavlov.springMVC.bean.Book;

import javax.annotation.PostConstruct;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Konstantin on 20.09.2016.
 *
 *
 */
@Repository
public class JDBCExample {

    @Autowired
    DataSource dataSource; //look to application-context.xml bean id='dataSource' definition

    private JdbcTemplate jdbcTemplate;
    @PostConstruct
    public void init() {
        System.out.println("JDBCExample postConstruct is called. datasource = " + dataSource);
        jdbcTemplate = new JdbcTemplate( dataSource);
    }


    public static Connection getConnection () throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bookmanager","root","root");
    }

    //JDBC TEMPLATE queryALL EXAMPLE
    public List<Book> queryAllBooks() throws SQLException, ClassNotFoundException {
        System.out.println("JDBCExample: queryAllBooks is called");

        String prepStatText = "SELECT id,name,description,author FROM books";

        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(prepStatText))
        {
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Book> books = new ArrayList<>();
            while (resultSet.next())
            {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String desc = resultSet.getString("description");
                String author = resultSet.getString("author");
                books.add(new Book(id,name,desc,author));
            }
            return books;
        }
    }

    //JDBC TEMPLATE DELETE EXAMPLE
    public void deleteBOOK(int id) throws SQLException, ClassNotFoundException {

        try(Connection connection = getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement("DELETE FROM images WHERE book_id=?");)
        {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();}

        try(Connection connection = getConnection();
            PreparedStatement preparedStatement= connection.prepareStatement("DELETE FROM books WHERE id=?");)
        {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();}
    }


    public Book getBook(int id) throws SQLException, ClassNotFoundException {

        String prepStatText = "SELECT books.id,books.name,books.description,books.author,images.image FROM  books LEFT OUTER JOIN  images ON books.id = images.book_id WHERE books.id=?";

        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(prepStatText))
        {
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Book book = new Book();
            while (resultSet.next())
            {
                book.setId(resultSet.getInt("books.id"));
                book.setName(resultSet.getString("books.name"));
                book.setDescription(resultSet.getString("books.description"));
                book.setAuthor(resultSet.getString("books.author"));
                book.setImage("\\resources\\uploadFiles\\"+resultSet.getString("images.image"));
            }
            return book;
        }

    }

    public void addBook(Book book,String fileName) throws SQLException, ClassNotFoundException {

        try (
                Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO books (name,author,description) VALUES (?,?,?);");
        )
        {
            preparedStatement.setString(1,book.getName());
            preparedStatement.setString(2,book.getAuthor());
            preparedStatement.setString(3,book.getDescription());
            preparedStatement.executeUpdate();
        }

        if (fileName!=null) {
            try (
                    Connection connection = getConnection();
                    PreparedStatement preparedStatement2 = connection.prepareStatement("INSERT INTO images (image,book_id) VALUE (?,( SELECT id FROM books WHERE name=? AND author=? AND description=?))");
            ) {
                preparedStatement2.setString(1, fileName);
                preparedStatement2.setString(2, book.getName());
                preparedStatement2.setString(3, book.getAuthor());
                preparedStatement2.setString(4, book.getDescription());
                preparedStatement2.executeUpdate();
            }
        }
    }
}
