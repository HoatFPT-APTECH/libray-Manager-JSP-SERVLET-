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
import model.Reader;
import repository.ReaderDAO;

/**
 *
 * @author hoatd
 */
public class ReaderBO implements IService<Reader> {
    protected ReaderDAO repository= new ReaderDAO();
    @Override
    public ArrayList<Reader> GetAll() {
        try {
            return this.repository.getAllReaders();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        };
        return null;
    }
    public Reader findReaderByIndentityCard(String IdentityCard){
        return this.repository.findReaderByIdentityCard(IdentityCard);
    }
    @Override
    public Reader GetDetail(int id) {
        try {
            return this.repository.findReader(id);
        } catch (SQLException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean Add(Reader model) {
        try {
            this.repository.insertReader(model);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }

    @Override
    public boolean Update(int id, Reader model) {
        try {
            this.repository.updateReader(model);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
       
    }

    @Override
    public boolean Delete(int id) {
        try {
            this.repository.deleteReader(id);
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ReaderBO.class.getName()).log(Level.SEVERE, null, ex);
        }
       return false;
    }
    
}
