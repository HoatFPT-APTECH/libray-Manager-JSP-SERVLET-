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
import java.util.Map;
import model.BorrowTracking;

public class BorrowTrackingDAO extends GenerateLibraryDAO{
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
            Date updated_at = rs.getDate("updated_at");
             double fine_amound=rs.getDouble("fine_amound");
            BorrowTracking borrowTracking = new BorrowTracking();
            borrowTracking.id = id;
            borrowTracking.request_id = requestId;
            borrowTracking.return_status = returnStatus;
            borrowTracking.deleted = deleted;
            borrowTracking.return_date = returnDate;
                borrowTracking.fine_amound=fine_amound;
            borrowTracking.updated_at= updated_at;
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
        String insert = "INSERT INTO borrow_tracking (request_id,return_date, return_status,fine_amound) VALUES (?, ?,?, ?)";
        preSt = (PreparedStatement) conn.prepareStatement(insert);
        preSt.setInt(1, borrowTracking.request_id);
        preSt.setDate(2, (java.sql.Date) borrowTracking.return_date);
        preSt.setInt(3, borrowTracking.return_status);
        preSt.setDouble(4, borrowTracking.fine_amound);
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
            double fine_amound=rs.getDouble("fine_amound");
            Date returnDate = rs.getDate("return_date");
             Date updated_at= rs.getDate("updated_at");
            BorrowTracking borrowTracking = new BorrowTracking();
            borrowTracking.id = id;
            borrowTracking.request_id = requestId;
            borrowTracking.return_status = returnStatus;
            borrowTracking.deleted = deleted;
            borrowTracking.fine_amound=fine_amound;
            borrowTracking.return_date = returnDate;
            borrowTracking.updated_at= updated_at;
            list.add(borrowTracking);
        }
        return list;
    }
    public ArrayList<BorrowTracking> getAllBorrowTrackingByConstraint(Map<String,String> constraint) throws ClassNotFoundException, SQLException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        ArrayList<BorrowTracking> list = new ArrayList<BorrowTracking>();
        String sql = "SELECT * FROM borrow_tracking where true and ";
        sql= generateSqlWithConstraint(constraint, sql);
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            int requestId = rs.getInt("request_id");
            int returnStatus = rs.getInt("return_status");
            int deleted = rs.getInt("deleted");
            double fine_amound=rs.getDouble("fine_amound");
            Date returnDate = rs.getDate("return_date");
             Date updated_at= rs.getDate("updated_at");
            BorrowTracking borrowTracking = new BorrowTracking();
            borrowTracking.id = id;
            borrowTracking.request_id = requestId;
            borrowTracking.return_status = returnStatus;
            borrowTracking.deleted = deleted;
            borrowTracking.fine_amound=fine_amound;
            borrowTracking.return_date = returnDate;
            borrowTracking.updated_at= updated_at;
            list.add(borrowTracking);
        }
        return list;
    }

    public int updateBorrowTracking(BorrowTracking borrowTracking) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        int result = 0;
        String sql = "UPDATE borrow_tracking SET request_id=?, return_status=?,fine_amound=?, return_date=? WHERE id=?";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
    
        pstm.setInt(1, borrowTracking.request_id);
        pstm.setInt(2, borrowTracking.return_status);
        pstm.setDouble(3, borrowTracking.fine_amound);
     
        pstm.setDate(4, new java.sql.Date(borrowTracking.return_date.getTime()));
        pstm.setInt(5, borrowTracking.id);
        
        result = pstm.executeUpdate();
        return result;
    }

    public int deleteBorrowTracking(int id) throws SQLException, ClassNotFoundException {
        if (conn == null)
            conn = ConnectDatabase.getMySQLConnection();
        int result = 0;
        String sql = "update borrow_tracking set deleted=1 WHERE id=?";
        PreparedStatement pstm = (PreparedStatement) conn.prepareStatement(sql);
        pstm.setInt(1, id);
        result = pstm.executeUpdate();
        return result;
    }
}

