package com.example.qltv.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.example.qltv.BO.BookBO;
import com.example.qltv.Bean.Book;
import com.example.qltv.Bean.Category;


@WebServlet("/ManageBook")
public class ManageBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookBO bookBO = new BookBO();

	public ManageBook() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if (request.getSession().getAttribute("User") == null) {
			String errorString = "Bạn cần đăng nhập trước";
			request.setAttribute("errorString", errorString);
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/view/login.jsp");
			dispatcher.forward(request, response);
		} else {
			String errorString = null;
			ArrayList<Book> list = null;
			try {
				list = bookBO.listBook();
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
			if (request.getAttribute("errorString") != null) {
				errorString = (String) request.getAttribute("errorString");
			}
			// Lưu thông tin vào request attribute trước khi forward sang views.
			request.setAttribute("errorString", errorString);
			request.setAttribute("bookList", list);
			request.getSession().setAttribute("Check", "ManageBook");
			// Forward sang /WEB-INF/views/productListView.jsp
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/view/manage_book.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}