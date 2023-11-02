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
public class Reader {
    public int id, books_borrowed, borrowed_time,role_id, deleted ;
    public String  name, reader_address, identity_card;
    public Date date_of_birth,start_day,end_day;
    public double deposit;

    public Reader() {
    }

    public Reader(int id, int books_borrowed, int borrowed_time, int role_id, int deleted, String name, String reader_address, String identity_card, Date date_of_birth, Date start_day, Date end_day, double deposit) {
        this.id = id;
        this.books_borrowed = books_borrowed;
        this.borrowed_time = borrowed_time;
        this.role_id = role_id;
        this.deleted = deleted;
        this.name = name;
        this.reader_address = reader_address;
        this.identity_card = identity_card;
        this.date_of_birth = date_of_birth;
        this.start_day = start_day;
        this.end_day = end_day;
        this.deposit = deposit;
    }
    
    
    
}
