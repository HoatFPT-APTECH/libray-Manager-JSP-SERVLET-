package model;

import java.util.Date;
import java.util.logging.Logger;

public class Book {

    public int id;
    public String name;
    public String image;
    public int amount;
    public int category_id;
    public int author_id;
    public Author author;
    public double price;
    public int numberOffPages;
    public int publisherId;
    public Date publicationYear;
    public Date createDay;
    public int deleted;
    public Publisher publisher;
       public Category category;

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public int getNumberOffPages() {
        return numberOffPages;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }
    

    public Publisher getPublisher() {
        return publisher;
    }

    public void setNumberOffPages(int numberOffPages) {
        this.numberOffPages = numberOffPages;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }
      
   
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumberOfPages() {
        return numberOffPages;
    }

    public void setNumberOfPages(int numberOffPages) {
        this.numberOffPages = numberOffPages;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    public Date getPublicationYear() {
        return publicationYear;
    }

    public void setPublicationYear(Date publicationYear) {
        this.publicationYear = publicationYear;
    }

    public Date getCreateDay() {
        return createDay;
    }

    public void setCreateDay(Date createDay) {
        this.createDay = createDay;
    }

    public int getDeleted() {
        return deleted;
    }

    public void setDeleted(int deleted) {
        this.deleted = deleted;
    }
}
