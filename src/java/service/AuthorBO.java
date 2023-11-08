package service;

import java.sql.SQLException;
import java.util.ArrayList;


import model.Author;

import repository.AuthorDAO;

public class AuthorBO{
	AuthorDAO authorDAO = new AuthorDAO();

	public Author findAuthor(String id) throws ClassNotFoundException, SQLException {

		return authorDAO.findAuthor(id);
	}

	public int insertAuthor(Author author) throws SQLException, ClassNotFoundException {
		int result = 0;
		result = authorDAO.insertAuthor(author);
		return result;
	}

	public ArrayList<Author> listAuthor() throws ClassNotFoundException, SQLException {

		return authorDAO.getAllAuthor();
	}

	public boolean deleteAuthor(String id) throws ClassNotFoundException, SQLException {
		int result = authorDAO.deleteAuthor(id);
		if (result != 0)
			return true;
		return false;
	}

	public int updateAuthor(Author author) throws ClassNotFoundException, SQLException {
		return authorDAO.updateAuthor(author);
	}

}
