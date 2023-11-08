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
import model.Publisher;
import service.BookBO;

/**
 *
 * @author NguyenTienDat
 */
public class PublisherDAO {

    public static int deletePublisher(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    Connection conn = null;
	Statement st = null;
	PreparedStatement preSt = null;

	public Publisher findPublisher(String id) throws SQLException, ClassNotFoundException {
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		String sql = "Select * from Publisher where id=?";

		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
		pstm.setString(1, id);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			int _id = rs.getInt("id");
			String name = rs.getString("name");
			Publisher publisher = new Publisher(_id, name);
			return publisher;
		}
		return null;
	}

	public int insertPublisher(Publisher publisher) throws SQLException, ClassNotFoundException {
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		try {
			st = (Statement) conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		int result = 0;
		String insert = "INSERT INTO Publisher (name) VALUES (?)";
		preSt = (PreparedStatement) conn.prepareStatement(insert);
		preSt.setString(1, publisher.getName());
		result = preSt.executeUpdate();
		return result;
	}

	public ArrayList<Publisher> getAllPublisher() throws ClassNotFoundException, SQLException {
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		ArrayList<Publisher> list = new ArrayList<Publisher>();
		String sql = "Select * from Publisher where deleted=0";
		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
		ResultSet rs = pstm.executeQuery();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			Publisher publisher = new Publisher();
			publisher.setId(id);
			publisher.setName(name);
			list.add(publisher);
		}
		return list;
	}

	public int updatePublisher(Publisher publisher) throws SQLException, ClassNotFoundException {
		int result = 0;
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		String sql = "Update Publisher set Name =? where id=? ";
		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

		pstm.setString(1, publisher.getName());
		pstm.setFloat(2, publisher.getId());
		result = pstm.executeUpdate();
		return result;
	}

	public int deletePublisher(String id) throws ClassNotFoundException, SQLException {
		int result = 0;
		if (conn == null)
			conn = ConnectDatabase.getMySQLConnection();
		
		String sql = "update Publisher set deleted=1 where id= ?";
		PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
		pstm.setString(1, id);
		result = pstm.executeUpdate();
		return result;
	}
}
