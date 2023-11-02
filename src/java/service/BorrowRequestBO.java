/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.BorrowRequest;
import repository.BorrowRequestDAO;

public class BorrowRequestBO implements IService<BorrowRequest> {
    protected BorrowRequestDAO repository = new BorrowRequestDAO();

    @Override
    public ArrayList<BorrowRequest> GetAll() {
        try {
            return this.repository.getAllBorrowRequests();
        } catch (Exception ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return null;
    }

    @Override
    public BorrowRequest GetDetail(int id) {
        try {
            return this.repository.findBorrowRequest(id);
        } catch (SQLException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean Add(BorrowRequest model) {
        try {
            this.repository.insertBorrowRequest(model);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean Update(int id, BorrowRequest model) {
        try {
            this.repository.updateBorrowRequest(model);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean Delete(int id) {
        try {
            this.repository.deleteBorrowRequest(id);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowRequestBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
