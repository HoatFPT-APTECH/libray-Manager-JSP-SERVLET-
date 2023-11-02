/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import model.BorrowTracking;

public class BorrowTrackingDAO {
    Connection conn = null;
    Statement st = null;
    PreparedStatement preSt = null;

    public BorrowTracking findBorrowTracking(int id) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        String sql = "SELECT * FROM borrow_tracking WHERE id=?";

        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setInt(1, id);

        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            int requestId = rs.getInt("request_id");
            int returnStatus = rs.getInt("return_status");
            int deleted = rs.getInt("deleted");
            Date returnDate = rs.getDate("return_date");

            BorrowTracking borrowTracking = new BorrowTracking();
            borrowTracking.id = id;
            borrowTracking.request_id = requestId;
            borrowTracking.return_status = returnStatus;
            borrowTracking.deleted = deleted;
            borrowTracking.return_date = returnDate;

            return borrowTracking;
        }
        return null;
    }

    public int insertBorrowTracking(BorrowTracking borrowTracking) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        try {
            st = (Statement) conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
        }
        int result = 0;
        String insert = "INSERT INTO borrow_tracking (request_id, return_status, deleted, return_date) VALUES (?, ?, ?, ?)";
        preSt = (PreparedStatement) conn.prepareStatement(insert);
        preSt.setInt(1, borrowTracking.request_id);
        preSt.setInt(2, borrowTracking.return_status);
        preSt.setInt(3, borrowTracking.deleted);
        preSt.setDate(4, new java.sql.Date(borrowTracking.return_date.getTime()));
        result = preSt.executeUpdate();
        System.out.println("Result: " + result);
        return result;
    }

    public ArrayList<BorrowTracking> getAllBorrowTracking() throws ClassNotFoundException, SQLException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        ArrayList<BorrowTracking> list = new ArrayList<BorrowTracking>();
        String sql = "SELECT * FROM borrow_tracking";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            int requestId = rs.getInt("request_id");
            int returnStatus = rs.getInt("return_status");
            int deleted = rs.getInt("deleted");
            Date returnDate = rs.getDate("return_date");

            BorrowTracking borrowTracking = new BorrowTracking();
            borrowTracking.id = id;
            borrowTracking.request_id = requestId;
            borrowTracking.return_status = returnStatus;
            borrowTracking.deleted = deleted;
            borrowTracking.return_date = returnDate;

            list.add(borrowTracking);
        }
        return list;
    }

    public int updateBorrowTracking(BorrowTracking borrowTracking) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        int result = 0;
        String sql = "UPDATE borrow_tracking SET request_id=?, return_status=?, deleted=?, return_date=? WHERE id=?";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    
        pstm.setInt(1, borrowTracking.request_id);
        pstm.setInt(2, borrowTracking.return_status);
        pstm.setInt(3, borrowTracking.deleted);
        pstm.setDate(4, new java.sql.Date(borrowTracking.return_date.getTime()));
        pstm.setInt(5, borrowTracking.id);
        
        result = pstm.executeUpdate();
        return result;
    }

    public int deleteBorrowTracking(int id) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        int result = 0;
        String sql = "DELETE FROM borrow_tracking WHERE id=?";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setInt(1, id);
        result = pstm.executeUpdate();
        return result;
    }
}

