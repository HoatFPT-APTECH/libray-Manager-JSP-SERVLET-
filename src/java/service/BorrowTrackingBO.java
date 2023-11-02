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
import model.BorrowTracking;
import repository.BorrowTrackingDAO;

public class BorrowTrackingBO implements IService<BorrowTracking> {
    protected BorrowTrackingDAO repository = new BorrowTrackingDAO();

    @Override
    public ArrayList<BorrowTracking> GetAll() {
        try {
            return this.repository.getAllBorrowTracking();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public BorrowTracking GetDetail(int id) {
        try {
            return this.repository.findBorrowTracking(id);
        } catch (SQLException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean Add(BorrowTracking model) {
        try {
            this.repository.insertBorrowTracking(model);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean Update(int id, BorrowTracking model) {
        try {
            this.repository.updateBorrowTracking(model);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    @Override
    public boolean Delete(int id) {
        try {
            this.repository.deleteBorrowTracking(id);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BorrowTrackingBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}

