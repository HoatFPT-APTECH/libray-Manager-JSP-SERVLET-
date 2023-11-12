package repository;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.sql.Timestamp;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import model.Author;
import model.Book;
import model.Category;
import static repository.ConnectDatabase.conn;
import service.BookBO;
import service.CategoryBO;

public class BookDAO {

    Connection conn = null;
    Statement st = null;
    PreparedStatement preSt = null;
    GenerateLibraryDAO library= new GenerateLibraryDAO();
    CategoryBO categoryBO = new CategoryBO();
    AuthorDAO authorDAO= new AuthorDAO();
    PublisherDAO publisherDAO= new PublisherDAO();
            

    public Book findBook(int id) throws SQLException, ClassNotFoundException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        String sql = "Select * from Book where id=?";

        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setInt(1, id);

        ResultSet rs = pstm.executeQuery();

        if(rs.next()) {
      
        String image= rs.getString("image");
        String name = rs.getString("name");
        String category_id = rs.getString("category_id");
        int author_id = rs.getInt("author_id");
        double price = rs.getDouble("price");
        
        Date publication_year = rs.getTimestamp("publication_year");
        int number_off_pages = rs.getInt("number_off_pages");
        int publisher_id = rs.getInt("publisher_id");
        int amount = rs.getInt("amount");
    
        Date create_day = rs.getDate("create_day");
        
        int deleted = rs.getInt("deleted");

        // Lấy thông tin của Category, Author và các thông tin khác tương ứng từ DB
        Category category = categoryBO.findCategory(category_id);
        Author author = authorDAO.findAuthor(String.valueOf(author_id));

        Book book = new Book();
        book.setId(id);
        book.setImage(image);
        book.setName(name);
        book.setCategory(category);
        book.setCategory_id(category.getId());
        book.setAuthor(author);
        book.setAuthor_id(author_id);
        book.setPrice(price);
        book.setPublicationYear(publication_year);
        book.setNumberOfPages(number_off_pages);
        book.setPublisherId(publisher_id);
        book.setAmount(amount);
        book.setCreateDay(create_day);
        book.setDeleted(deleted);
             book.publisher= this.publisherDAO.findPublisher(String.valueOf(book.publisherId));

        return book;
    }
        return null;
    }

     public int insertBook(Book book) throws SQLException, ClassNotFoundException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        try {
            st = (Statement) conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int result = 0;
        String insert = "INSERT INTO Book (name, category_id, amount, image, author_id, price, publication_year, number_off_pages, publisher_id) VALUES (?,?,?,?,?,?,?,?,?)";
        preSt = (PreparedStatement) conn.prepareStatement(insert);
        preSt.setString(1, book.getName());
        preSt.setInt(2, book.getCategory_id());
        preSt.setInt(3, book.getAmount());
        preSt.setString(4, book.getImage());
        preSt.setInt(5, book.getAuthor_id());
        preSt.setDouble(6, book.getPrice());
        preSt.setTimestamp(7, new java.sql.Timestamp(book.getPublicationYear().getTime()));
        preSt.setInt(8, book.getNumberOfPages());
        preSt.setInt(9, book.getPublisherId());
        
        result = preSt.executeUpdate();
        System.out.println("Ketqua" + result);
        return result;
    }

    public ArrayList<Book> getAllBook() throws ClassNotFoundException, SQLException {
    if (conn == null) {
        conn = ConnectDatabase.getMySQLConnection();
    }
    ArrayList<Book> list = new ArrayList<Book>();
    String sql = "SELECT * FROM Book WHERE deleted = 0 ORDER BY create_day DESC";
    PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    ResultSet rs = pstm.executeQuery();

    while (rs.next()) {
         int id = rs.getInt("id");
        String image= rs.getString("image");
        String name = rs.getString("name");
        String category_id = rs.getString("category_id");
        int author_id = rs.getInt("author_id");
        double price = rs.getDouble("price");
        
        Date publication_year = rs.getTimestamp("publication_year");
        int number_off_pages = rs.getInt("number_off_pages");
        int publisher_id = rs.getInt("publisher_id");
        int amount = rs.getInt("amount");
    
        Date create_day = rs.getDate("create_day");
        
        int deleted = rs.getInt("deleted");

        // Lấy thông tin của Category, Author và các thông tin khác tương ứng từ DB
        Category category = categoryBO.findCategory(category_id);
        Author author = authorDAO.findAuthor(String.valueOf(author_id));

        Book book = new Book();
        book.setId(id);
        book.setImage(image);
        book.setName(name);
        book.setCategory(category);
        book.setCategory_id(category.getId());
        book.setAuthor(author);
        book.setPrice(price);
        book.setPublicationYear(publication_year);
        book.setNumberOfPages(number_off_pages);
        book.setPublisherId(publisher_id);
        book.setAmount(amount);
        book.setCreateDay(create_day);
        book.setDeleted(deleted);
             book.publisher= this.publisherDAO.findPublisher(String.valueOf(book.publisherId));

        list.add(book);
    }
    return list;
}
    public ArrayList<Book> getAllBook(ArrayList<String> constraint) throws ClassNotFoundException, SQLException {
    if (conn == null) {
        conn = ConnectDatabase.getMySQLConnection();
    }
    ArrayList<Book> list = new ArrayList<Book>();
    String sql = "SELECT * FROM Book WHERE deleted = 0 ";
    
    sql= this.library.generateSqlWithConstraint(constraint, sql);

    PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    ResultSet rs = pstm.executeQuery();

    while (rs.next()) {
        int id = rs.getInt("id");
        String image= rs.getString("image");
        String name = rs.getString("name");
        String category_id = rs.getString("category_id");
        int author_id = rs.getInt("author_id");
        double price = rs.getDouble("price");
        
        Date publication_year = rs.getTimestamp("publication_year");
        int number_off_pages = rs.getInt("number_off_pages");
        int publisher_id = rs.getInt("publisher_id");
        int amount = rs.getInt("amount");
    
        Date create_day = rs.getDate("create_day");
        
        int deleted = rs.getInt("deleted");

        // Lấy thông tin của Category, Author và các thông tin khác tương ứng từ DB
        Category category = categoryBO.findCategory(category_id);
        Author author = authorDAO.findAuthor(String.valueOf(author_id));

        Book book = new Book();
        book.setId(id);
        book.setImage(image);
        book.setName(name);
        book.setCategory(category);
        book.setCategory_id(category.getId());
        book.setAuthor(author);
        book.setPrice(price);
        book.setPublicationYear(publication_year);
        book.setNumberOfPages(number_off_pages);
        book.setPublisherId(publisher_id);
        book.setAmount(amount);
        book.setCreateDay(create_day);
        book.setDeleted(deleted);
             book.publisher= this.publisherDAO.findPublisher(String.valueOf(book.publisherId));

        list.add(book);
    }
    return list;
}


    public ArrayList<Book> getSearchBook(String name_search) throws ClassNotFoundException, SQLException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        System.out.println("Day" + name_search);
        ArrayList<Book> list = new ArrayList<Book>();
        String sql = "Select * from Book where name like '%" + name_search + "%';";
//		String sql = "Select * from Book where name like '%l';";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    ResultSet rs = pstm.executeQuery();

    while (rs.next()) {
        int id = rs.getInt("id");
        String name = rs.getString("name");
        String category_id = rs.getString("category_id");
        int author_id = rs.getInt("author_id");
        double price = rs.getDouble("price");
        Timestamp publication_yearTimestamp = rs.getTimestamp("publication_year");
        Date publication_year = new Date(publication_yearTimestamp.getTime());
        int number_off_pages = rs.getInt("number_off_pages");
        int publisher_id = rs.getInt("publisher_id");
        int amount = rs.getInt("amount");
        Timestamp create_dayTimestamp = rs.getTimestamp("create_day");
        Date create_day = new Date(create_dayTimestamp.getTime());
        int deleted = rs.getInt("deleted");

        // Lấy thông tin của Category, Author và các thông tin khác tương ứng từ DB
        Category category = categoryBO.findCategory(category_id);
        Author author = authorDAO.findAuthor(String.valueOf(author_id));

        Book book = new Book();
        book.setId(id);
        book.setName(name);
        book.setCategory(category);
        book.setCategory_id(category.getId());
        book.setAuthor(author);
        book.setPrice(price);
        book.setPublicationYear(publication_year);
        book.setNumberOfPages(number_off_pages);
        book.setPublisherId(publisher_id);
        book.setAmount(amount);
        book.setCreateDay(create_day);
        book.setDeleted(deleted);

        list.add(book);
    }
    return list;
    }

     public int updateBook(Book book) throws SQLException, ClassNotFoundException {
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        int result = 0;
        String sql = "UPDATE Book SET name=?, category_id=?, amount=?, image=?, author_id=?, price=?, publication_year=?, number_off_pages=?, publisher_id=? WHERE id=?";

        preSt = (PreparedStatement) conn.prepareStatement(sql);
        preSt.setString(1, book.getName());
        preSt.setInt(2, book.getCategory_id());
         System.out.println(book.getCategory_id());
        preSt.setInt(3, book.getAmount());
        preSt.setString(4, book.getImage());
        preSt.setInt(5, book.getAuthor_id());
        preSt.setDouble(6, book.getPrice());
        preSt.setTimestamp(7, new java.sql.Timestamp(book.getPublicationYear().getTime()));
        preSt.setInt(8, book.getNumberOfPages());
        preSt.setInt(9, book.getPublisherId());
        preSt.setInt(10, book.getId());
         System.out.println(preSt.getPreparedSql());

        result = preSt.executeUpdate();
        return result;
    }
    public int deleteBook(int id) throws ClassNotFoundException, SQLException {

        int result = 0;
        if (conn == null) {
            conn = ConnectDatabase.getMySQLConnection();
        }
        try {

            String delete = "update Book set deleted=1 where id= ?";

            preSt = (PreparedStatement) conn.prepareStatement(delete);
            preSt.setInt(1, id);
            result = preSt.executeUpdate();
            System.out.println("Deleted: " + result);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
