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
public class BorrowTracking {
    public int id, request_id, return_status, deleted;
    public double fine_amound;
    public Date return_date, updated_at;

    public BorrowTracking() {
    }

    public BorrowTracking(int id, int request_id, int return_status,double fine_amound, int deleted, Date return_date) {
        this.id = id;
        this.request_id = request_id;
        this.return_status = return_status;
        this.deleted = deleted;
        this.fine_amound= fine_amound;
        this.return_date = return_date;
    }

    public BorrowTracking(int id, int request_id, int return_status, int deleted, Date return_date, Date updated_at) {
        this.id = id;
        this.request_id = request_id;
        this.return_status = return_status;
        this.deleted = deleted;
        this.return_date = return_date;
        this.updated_at = updated_at;
    }
      
}
