package com.example.qltv.Controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import com.example.qltv.BO.BookBO;
import com.example.qltv.BO.CategoryBO;
import com.example.qltv.Bean.Book;
import com.example.qltv.Bean.Category;


@MultipartConfig
@WebServlet("/AddBook")
public class AddBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryBO categoryBO = new CategoryBO();
	private BookBO bookBO = new BookBO();


	public AddBook() {
		super();
		// TODO Auto-generated constructor stub
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("User") == null) {
			String errorString = "Bạn cần đăng nhập trước";
			request.setAttribute("errorString", errorString);
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/view/login.jsp");
			dispatcher.forward(request, response);
		} else {
			String errorString = null;
			ArrayList<Category> list = null;
			try {
				list = categoryBO.listCategory();
			} catch (Exception e) {
				e.printStackTrace();
				errorString = e.getMessage();
			}
			if (request.getAttribute("errorString") != null) {
				errorString = (String) request.getAttribute("errorString");
			}
			request.setAttribute("errorString", errorString);
			request.setAttribute("categoryList", list);
			request.getSession().setAttribute("Check", "AddBook");
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/view/add_book.jsp");
			dispatcher.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String category_id = request.getParameter("category");
		String count = request.getParameter("count");
		Part file = request.getPart("fileImage");
		String savePath = getServletContext().getRealPath("/") + "Resources\\img\\products";
		File fileSaveDir = new File(savePath);
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		String fileName = extractfilename(file);
		file.write(savePath + File.separator + fileName);
		Book book = new Book();
		book.setName(name);
		Category category = new Category();
		try {
			category = categoryBO.findCategory(category_id);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		book.setCategory(category);
		book.setAmount(count);
		book.setImage(fileName);
		try {
			int result = bookBO.insertBook(book);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("errorString", "Thêm sách thành công");
		doGet(request, response);
	}

	private String extractfilename(Part file) {
		String cd = file.getHeader("content-disposition");
		String[] items = cd.split(";");
		for (String string : items) {
			if (string.trim().startsWith("filename")) {
				return string.substring(string.indexOf("=") + 2, string.length() - 1);
			}
		}
		return "";
	}

}
