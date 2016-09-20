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
            PreparedStatement preparedStatement= connection.prepareStatement("DELETE FROM books WHERE id=?");)
        {
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();}
    }






}
