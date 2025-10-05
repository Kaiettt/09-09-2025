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
        // try to find product name for a friendly message
        String removedName = null;
        if (cart.getItems() != null) {
          for (com.model.CartItem item : cart.getItems()) {
            if (item.getProduct().getId() == productId) {
              removedName = item.getProduct().getName();
              break;
            }
          }
        }
        cart.removeProduct(productId);
        if (removedName != null) {
          session.setAttribute("successMessage", "Removed '" + removedName + "' from cart");
        } else {
          session.setAttribute("successMessage", "Removed product from cart");
        }
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
        // try to find product name for message
        String updatedName = null;
        if (cart.getItems() != null) {
          for (com.model.CartItem item : cart.getItems()) {
            if (item.getProduct().getId() == productId) {
              updatedName = item.getProduct().getName();
              break;
            }
          }
        }
        cart.updateQuantity(productId, quantity);
        if (updatedName != null) {
          session.setAttribute("successMessage", "Updated quantity for '" + updatedName + "' to " + quantity);
        } else {
          session.setAttribute("successMessage", "Updated product quantity");
        }
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
        // set a session-level success message so it survives the redirect
        session.setAttribute("successMessage", "Added '" + productName + "' to cart");
        response.sendRedirect(request.getContextPath() + "/product");
      }
}
