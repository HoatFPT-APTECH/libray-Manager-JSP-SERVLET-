package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Author;
import model.Book;
import model.Category;
import model.Publisher;
import service.AuthorBO;
import service.BookBO;
import service.CategoryBO;
import service.PublisherBO;


@WebServlet(name = "ManagerBook", urlPatterns = {"/ManagerBook"})
public class ManageBook extends HttpServlet {

    private static final long serialVersionUID = 1L;
   private BookBO bookService = new BookBO();
        private CategoryBO serviceCategory= new CategoryBO();
    private PublisherBO servicePublisher= new PublisherBO();
    private AuthorBO serviceAuthorBO= new AuthorBO();

    public ManageBook() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String errorString = null;
        ArrayList<Book> list = null;
        // Set default values if needed
        request.setAttribute("name", "");
        request.setAttribute("category_id",0);
        request.setAttribute("author_id",0);
        request.setAttribute("created_day", 0);

        try {
            list = bookService.getAllBooks();
             ArrayList<Publisher> listPublisher= new ArrayList<Publisher>();
            ArrayList<Category> listCategory= new ArrayList<Category>();
            ArrayList<Author> listAuthor= new ArrayList<Author>();
            listPublisher= this.servicePublisher.listPublisher();
            listAuthor= this.serviceAuthorBO.listAuthor();
            listCategory= this.serviceCategory.listCategory();
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listAuthor", listAuthor);
            request.setAttribute("listPublisher", listPublisher);
        } catch (Exception e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }

        if (request.getAttribute("errorString") != null) {
            errorString = (String) request.getAttribute("errorString");
        }

        request.setAttribute("errorString", errorString);
        request.setAttribute("bookList", list);
        request.getSession().setAttribute("Check", "ManageBook");
        request.setAttribute("page", "manager_book.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<String> constraints = new ArrayList<>();
    
        String name = request.getParameter("name");
        int category_id = Integer.valueOf(request.getParameter("category_id")) ;
        int author_id = Integer.valueOf(request.getParameter("author_id")) ;
        int time = Integer.parseInt(request.getParameter("created_day"));

        if (name.trim().length() > 0) {
            constraints.add("name like '%" + name + "%'");
        }

        if (category_id > 0) {
            constraints.add("category_id ="+category_id);
        }

        if (author_id > 0) {
            constraints.add("author_id="+author_id);
        }

        if (time != 0) {
            if (time != 1) {
                constraints.add("true order by create_day asc");
            } else {
                constraints.add("true order by create_day desc");
            }
        }

        ArrayList<Book> list = new ArrayList<>();
        try {
            list = bookService.getAllBooks(constraints);
            
             ArrayList<Publisher> listPublisher= new ArrayList<Publisher>();
            ArrayList<Category> listCategory= new ArrayList<Category>();
            ArrayList<Author> listAuthor= new ArrayList<Author>();
            listPublisher= this.servicePublisher.listPublisher();
            listAuthor= this.serviceAuthorBO.listAuthor();
            listCategory= this.serviceCategory.listCategory();
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("listAuthor", listAuthor);
            request.setAttribute("listPublisher", listPublisher);
        } catch (Exception e) {
            e.printStackTrace();
            
        }

        request.setAttribute("errorString", "Kết quả tìm kiếm /lọc .");
        request.setAttribute("bookList", list);
        request.setAttribute("name", name);
        request.setAttribute("category_id", category_id);
        request.setAttribute("author_id", author_id);
        request.setAttribute("created_day", time);
        request.getSession().setAttribute("Check", "ManageBook");
        request.setAttribute("page", "manager_book.jsp");
        RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}