/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import model.Author;
import service.BookBO;

/*import com.mysql.jdbc.Connection;*/
//import com.mysql.jdbc.PreparedStatement;
//import com.mysql.jdbc.Statement;


/**
 *
 * @author NguyenTienDat
 */
public class AuthorDAO {
	Connection conn = null;
	Statement st = null;
	PreparedStatement preSt = null;

	public Author findAuthor(String id) throws SQLException, ClassNotFoundException {
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		String sql = "Select * from Author where id=?";

		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
		pstm.setString(1, id);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			int _id = rs.getInt("id");
			String name = rs.getString("name");
			Author author = new Author(_id, name);
			return author;
		}
		return null;
	}

	public int insertAuthor(Author author) throws SQLException, ClassNotFoundException {
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		try {
			st = (Statement) conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int result = 0;
		String insert = "INSERT INTO Author (name) VALUES (?)";
		preSt = (PreparedStatement) conn.prepareStatement(insert);
		preSt.setString(1, author.getName());
		result = preSt.executeUpdate();
		return result;
	}

	public ArrayList<Author> getAllAuthor() throws ClassNotFoundException, SQLException {
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		ArrayList<Author> list = new ArrayList<Author>();
		String sql = "Select * from Author";
		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			Author author = new Author();
			author.setId(id);
			author.setName(name);
			list.add(author);
		}
		return list;
	}

	public int updateAuthor(Author author) throws SQLException, ClassNotFoundException {
		int result = 0;
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		String sql = "Update Author set Name =? where id=? ";
		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

		pstm.setString(1, author.getName());
		pstm.setFloat(2, author.getId());
		result = pstm.executeUpdate();
		return result;
	}

	public int deleteAuthor(String id) throws ClassNotFoundException, SQLException {
		int result = 0;
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		
		String sql = "update Author set deleted=1 where id= ?";
		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
		pstm.setString(1, id);
		result = pstm.executeUpdate();
		return result;
	}
}
