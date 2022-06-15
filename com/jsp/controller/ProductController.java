package com.jsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Servlet을 쓰기 위해서 무지성으로 따라쳐주면 된다. name은 마음데로 해도 됨
// Servlet은 Get이나 Post에서 Servlet을 지나도록 하게 해 준다.
@WebServlet(name = "ProductController", urlPatterns = {"/products.do", "/addProdcut.do"})
public class ProductController extends HttpServlet{
	
	private static final long serialVersionUID = -6188828074935714283L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 요청주소(/products.do)를 얻기 위한 코드
		String command = req.getRequestURI().substring(req.getContextPath().length());
		
		if (command.equals("/products.do")) {
			
		} else if (command.equals("/addProdcut.do"))
		
		System.out.println("통과확인");
		
		req.getRequestDispatcher("products.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
