package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Product;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    @Override
    public void init(){

    }
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  List<Product> products = new ArrayList<>();
  products.add(new Product(1, "Product A", 10.0));
  products.add(new Product(2, "Product B", 20.0));    
  products.add(new Product(3, "Product C", 30.0));
  request.setAttribute("products", products);
  RequestDispatcher dispatcher = request.getRequestDispatcher("/product-list.jsp");
  dispatcher.forward(request, response);
            }
}
