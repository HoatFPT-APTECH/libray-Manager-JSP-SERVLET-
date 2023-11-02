/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;

/**
 *
 * @author hoatd
 */
public class BorrowRequest {
    public int id, reader_id,book_id, deleted;
    public Date due_date;
    public Reader reader=null;
    public Book book=null;

    public BorrowRequest() {
    }

    public BorrowRequest(int id, int reader_id, int book_id, int deleted, Date due_date) {
        this.id = id;
        this.reader_id = reader_id;
        this.book_id = book_id;
        this.deleted = deleted;
        this.due_date = due_date;
    }
    
}
