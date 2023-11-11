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
public class BookStatistics {
    private int id;
    private String image;
    private String nameBook;
    private int amountBook;
    private int countServed;
    private int returnGood;
    private int returnBad;
    private int returnVeryBad;
    private double totalFineAmount;

    // Constructors, getters, and setters

    public BookStatistics() {
    }

    public BookStatistics(int id, String image, String nameBook, int amountBook,
                          int countServed, int returnGood, int returnBad,
                          int returnVeryBad, double totalFineAmount) {
        this.id = id;
        this.image = image;
        this.nameBook = nameBook;
        this.amountBook = amountBook;
        this.countServed = countServed;
        this.returnGood = returnGood;
        this.returnBad = returnBad;
        this.returnVeryBad = returnVeryBad;
        this.totalFineAmount = totalFineAmount;
    }

    public int getId() {
        return id;
    }

    public String getImage() {
        return image;
    }

    public String getNameBook() {
        return nameBook;
    }

    public int getAmountBook() {
        return amountBook;
    }

    public int getCountServed() {
        return countServed;
    }

    public int getReturnGood() {
        return returnGood;
    }

    public int getReturnBad() {
        return returnBad;
    }

    public int getReturnVeryBad() {
        return returnVeryBad;
    }

    public double getTotalFineAmount() {
        return totalFineAmount;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setNameBook(String nameBook) {
        this.nameBook = nameBook;
    }

    public void setAmountBook(int amountBook) {
        this.amountBook = amountBook;
    }

    public void setCountServed(int countServed) {
        this.countServed = countServed;
    }

    public void setReturnGood(int returnGood) {
        this.returnGood = returnGood;
    }

    public void setReturnBad(int returnBad) {
        this.returnBad = returnBad;
    }

    public void setReturnVeryBad(int returnVeryBad) {
        this.returnVeryBad = returnVeryBad;
    }

    public void setTotalFineAmount(double totalFineAmount) {
        this.totalFineAmount = totalFineAmount;
    }

   
}
