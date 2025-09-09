package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Cart;
import com.model.Product;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
     @Override
    public void init(){

    }
      @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                request.getSession().setAttribute("cart", cart);
            }
            request.setAttribute("cart", cart);
            RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
            rd.forward(request, response);
        }

      @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                 String action = request.getParameter("action");
                 if (action != null) {
                    if (action.startsWith("update_")) {
                        handleUpdateCart(request, response,action.split("_")[1]);

                    } else if (action.startsWith("remove_")) {
                        handleRemoveFromCart(request, response,action.split("_")[1]);
                    }
                 }
                 else{
                    handleAddToCart(request, response);
                 }
                 
            
            }
      private void handleRemoveFromCart(HttpServletRequest request, HttpServletResponse response,String id) throws IOException {
        HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            int productId = Integer.parseInt(id);
            cart.removeProduct(productId);
            response.sendRedirect(request.getContextPath() + "/cart");
    }
      private void handleUpdateCart(HttpServletRequest request, HttpServletResponse response,String id) throws IOException {
        HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            int productId = Integer.parseInt(id);
            int quantity = Integer.parseInt(request.getParameter("quantity_" + productId));
            cart.updateQuantity(productId, quantity);
            response.sendRedirect(request.getContextPath() + "/cart");
    }
      private void handleAddToCart(HttpServletRequest request, HttpServletResponse response) throws IOException {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            Product product = new Product(productId, productName, productPrice);
            // 2. Retrieve or create cart from session
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null){
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            cart.addProduct(product);
            response.sendRedirect(request.getContextPath() + "/product");
      }
}
