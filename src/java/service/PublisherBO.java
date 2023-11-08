/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author NguyenTienDat
 */
import model.Publisher;

import repository.PublisherDAO;

public class PublisherBO {
    PublisherDAO publisherDAO = new PublisherDAO();

	public Publisher findPublisher(String id) throws ClassNotFoundException, SQLException {

		return publisherDAO.findPublisher(id);
	}

	public int insertPublisher(Publisher publisher) throws SQLException, ClassNotFoundException {
		int result = 0;
		result = publisherDAO.insertPublisher(publisher);
		return result;
	}

	public ArrayList<Publisher> listPublisher() throws ClassNotFoundException, SQLException {

		return publisherDAO.getAllPublisher();
	}

	public boolean deletePublisher(String id) throws ClassNotFoundException, SQLException {
		int result = publisherDAO.deletePublisher(id);
		if (result != 0)
			return true;
		return false;
	}

	public int updatePublisher(Publisher publisher) throws ClassNotFoundException, SQLException {
		return publisherDAO.updatePublisher(publisher);
	}
    
}
