/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.mysql.jdbc.PreparedStatement;

import com.mysql.jdbc.Statement;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Reader;

public class ReaderDAO extends GenerateLibraryDAO {
    Connection conn = null;
    Statement st = null;
    PreparedStatement preSt = null;

    public ReaderDAO()  {
        try {
            this.conn= ConnectDatabase.getMySQLConnection();
        } catch (Exception ex) {
            Logger.getLogger(ReaderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
public ArrayList< Reader> findReaderByIdentityCard(String indentityCard){
       ArrayList<Reader> list= new ArrayList<Reader>();
       String sql ="select * from reader where identity_card like ? ";
       try {
           PreparedStatement ps= (PreparedStatement)  this.conn.prepareStatement(sql);
           ps.setString(1, "%" + indentityCard + "%");
           ResultSet rs= ps.executeQuery();
           while(rs.next()){
                    int id = rs.getInt("id");
            int booksBorrowed = rs.getInt("books_borrowed");
            int borrowedTime = rs.getInt("borrowed_time");
            int roleId = rs.getInt("role_id");
            int deleted = rs.getInt("deleted");
            String name = rs.getString("name");
            String readerAddress = rs.getString("reader_address");
            String identityCard = rs.getString("identity_card");
            Date dateOfBirth = rs.getDate("date_of_birth");
            Date startDay = rs.getDate("start_day");
            Date endDay = rs.getDate("end_day");
            double deposit = rs.getDouble("deposit");

            Reader reader = new Reader();
            reader.id = id;
            reader.books_borrowed = booksBorrowed;
            reader.borrowed_time = borrowedTime;
            reader.role_id = roleId;
            reader.deleted = deleted;
            reader.name = name;
            reader.reader_address = readerAddress;
            reader.identity_card = identityCard;
            reader.date_of_birth = dateOfBirth;
            reader.start_day = startDay;
            reader.end_day = endDay;
            reader.deposit = deposit;
            list.add(reader);
           }
           return list;
       } catch (Exception e) {
           e.printStackTrace();
       }
       return null;
   }
    public Reader findReader(int id) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        String sql = "SELECT * FROM reader WHERE id=?";

        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setInt(1, id);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            int booksBorrowed = rs.getInt("books_borrowed");
            int borrowedTime = rs.getInt("borrowed_time");
            int roleId = rs.getInt("role_id");
            int deleted = rs.getInt("deleted");
            String name = rs.getString("name");
            String readerAddress = rs.getString("reader_address");
            String identityCard = rs.getString("identity_card");
            Date dateOfBirth = rs.getDate("date_of_birth");
            Date startDay = rs.getDate("start_day");
            Date endDay = rs.getDate("end_day");
            double deposit = rs.getDouble("deposit");

            Reader reader = new Reader();
            reader.id = id;
            reader.books_borrowed = booksBorrowed;
            reader.borrowed_time = borrowedTime;
            reader.role_id = roleId;
            reader.deleted = deleted;
            reader.name = name;
            reader.reader_address = readerAddress;
            reader.identity_card = identityCard;
            reader.date_of_birth = dateOfBirth;
            reader.start_day = startDay;
            reader.end_day = endDay;
            reader.deposit = deposit;

            return reader;
        }
        return null;
    }
    
  
    public int insertReader(Reader reader) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        try {
            st = (Statement) conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int result = 0;
        String insert = "INSERT INTO Reader (books_borrowed, borrowed_time, role_id, deleted, name, reader_address, identity_card, date_of_birth, start_day, end_day, deposit) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        preSt = (PreparedStatement) conn.prepareStatement(insert);
        preSt.setInt(1, reader.books_borrowed);
        preSt.setInt(2, reader.borrowed_time);
        preSt.setInt(3, reader.role_id);
        preSt.setInt(4, reader.deleted);
        preSt.setString(5, reader.name);
        preSt.setString(6, reader.reader_address);
        preSt.setString(7, reader.identity_card);
        preSt.setDate(8, new java.sql.Date(reader.date_of_birth.getTime()));
        preSt.setDate(9, new java.sql.Date(reader.start_day.getTime()));
        preSt.setDate(10, new java.sql.Date(reader.end_day.getTime()));
        preSt.setDouble(11, reader.deposit);
        result = preSt.executeUpdate();
        System.out.println("Result: " + result);
        return result;
    }
      public ArrayList<Reader> getAllReaders(ArrayList<String> constraint) throws ClassNotFoundException, SQLException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        ArrayList<Reader> list = new ArrayList<Reader>();
        String sql = "SELECT * FROM Reader where deleted=0 ";
         
            sql= super.generateSqlWithConstraint(constraint, sql);

          
          System.out.println(sql);
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            int booksBorrowed = rs.getInt("books_borrowed");
            int borrowedTime = rs.getInt("borrowed_time");
            int roleId = rs.getInt("role_id");
            int deleted = rs.getInt("deleted");
            String name = rs.getString("name");
            String readerAddress = rs.getString("reader_address");
            String identityCard = rs.getString("identity_card");
            Date dateOfBirth = rs.getDate("date_of_birth");
            Date startDay = rs.getDate("start_day");
            Date endDay = rs.getDate("end_day");
            double deposit = rs.getDouble("deposit");

            Reader reader = new Reader();
            reader.id = id;
            reader.books_borrowed = booksBorrowed;
            reader.borrowed_time = borrowedTime;
            reader.role_id = roleId;
            reader.deleted = deleted;
            reader.name = name;
            reader.reader_address = readerAddress;
            reader.identity_card = identityCard;
            reader.date_of_birth = dateOfBirth;
            reader.start_day = startDay;
            reader.end_day = endDay;
            reader.deposit = deposit;

            list.add(reader);
        }
        return list;
    }
    public ArrayList<Reader> getAllReaders() throws ClassNotFoundException, SQLException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        ArrayList<Reader> list = new ArrayList<Reader>();
        String sql = "SELECT * FROM Reader where deleted=0";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            int booksBorrowed = rs.getInt("books_borrowed");
            int borrowedTime = rs.getInt("borrowed_time");
            int roleId = rs.getInt("role_id");
            int deleted = rs.getInt("deleted");
            String name = rs.getString("name");
            String readerAddress = rs.getString("reader_address");
            String identityCard = rs.getString("identity_card");
            Date dateOfBirth = rs.getDate("date_of_birth");
            Date startDay = rs.getDate("start_day");
            Date endDay = rs.getDate("end_day");
            double deposit = rs.getDouble("deposit");

            Reader reader = new Reader();
            reader.id = id;
            reader.books_borrowed = booksBorrowed;
            reader.borrowed_time = borrowedTime;
            reader.role_id = roleId;
            reader.deleted = deleted;
            reader.name = name;
            reader.reader_address = readerAddress;
            reader.identity_card = identityCard;
            reader.date_of_birth = dateOfBirth;
            reader.start_day = startDay;
            reader.end_day = endDay;
            reader.deposit = deposit;

            list.add(reader);
        }
        return list;
    }
public int updateReader(Reader reader) throws SQLException, ClassNotFoundException {
    if (conn == null)
        conn = ConnectDatabase.getMySQLConnection();
    int result = 0;
    String sql = "UPDATE Reader SET books_borrowed=?, borrowed_time=?, role_id=?, deleted=?, name=?, reader_address=?, identity_card=?, date_of_birth=?, start_day=?, end_day=?, deposit=? WHERE id=?";
    PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);

    pstm.setInt(1, reader.books_borrowed);
    pstm.setInt(2, reader.borrowed_time);
    pstm.setInt(3, reader.role_id);
    pstm.setInt(4, reader.deleted);
    pstm.setString(5, reader.name);
    pstm.setString(6, reader.reader_address);
    pstm.setString(7, reader.identity_card);
    pstm.setDate(8, new java.sql.Date(reader.date_of_birth.getTime()));
    pstm.setDate(9, new java.sql.Date(reader.start_day.getTime()));
    pstm.setDate(10, new java.sql.Date(reader.end_day.getTime()));
    pstm.setDouble(11, reader.deposit);
    pstm.setInt(12, reader.id);
    
    result = pstm.executeUpdate();
    return result;
}
public int deleteReader(int id) throws SQLException, ClassNotFoundException {
    if (conn == null)
        conn = ConnectDatabase.getMySQLConnection();
    int result = 0;
    String sql = "UPDATE Reader SET deleted=1 WHERE id=?";
    PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    pstm.setInt(1, id);
    result = pstm.executeUpdate();
    return result;
}


}
