/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author hoatd
 */
public class modelExport {
     public String id;
  
   public String nameBook;
    public String amountBook;
    public String countServed;
    public String countBorrow;
    public String returnGood;
    public String returnBad;
    public String returnVeryBad;
    public String totalFineAmount;

    public modelExport(String id, String nameBook, String amountBook, String countServed, String countBorrow, String returnGood, String returnBad, String returnVeryBad, String totalFineAmount) {
        this.id = id;
        this.nameBook = nameBook;
        this.amountBook = amountBook;
        this.countServed = countServed;
        this.countBorrow = countBorrow;
        this.returnGood = returnGood;
        this.returnBad = returnBad;
        this.returnVeryBad = returnVeryBad;
        this.totalFineAmount = totalFineAmount;
    }

        
}
