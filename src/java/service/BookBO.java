package service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


import model.Book;
import repository.BookDAO;
import repository.ConnectDatabase;
import static repository.ConnectDatabase.conn;



public class BookBO {
	BookDAO BookDAO = new BookDAO();

	public Book findBook(int id) throws ClassNotFoundException, SQLException {

		return BookDAO.findBook(id);
	}

	public int insertBook(Book book) throws SQLException, ClassNotFoundException {
		int result = 0;
		result = BookDAO.insertBook(book);
		String s ="ss";
		
		return result;
	}

	public ArrayList<Book> listBook() throws ClassNotFoundException, SQLException {
		return BookDAO.getAllBook();
	}
	public ArrayList<Book> searchBook(String name_search) throws ClassNotFoundException, SQLException {
		return BookDAO.getSearchBook(name_search);
	}
        
        public int deleteBook (int id) throws ClassNotFoundException, SQLException{
                return BookDAO.deleteBook(id);
        }
	
	public int updateBook(Book Book) throws ClassNotFoundException, SQLException {
		return BookDAO.updateBook(Book);
	}
<<<<<<< HEAD
   
        
public int deleteBook (int id) throws ClassNotFoundException, SQLException{
                return BookDAO.deleteBook(id);
        }
=======

    

>>>>>>> b5ecd520dbbc9499c4eba6437741d855ff5b27cd
}
