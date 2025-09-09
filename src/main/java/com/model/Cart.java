package com.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private int id;
    private List<CartItem> items;
    public Cart(){
        this.items = new ArrayList<>();
    }
    public Cart(int id, List<CartItem> items) {
        this.id = id;
        this.items = items;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public List<CartItem> getItems() {
        return items;
    }
    public void setItems(List<CartItem> items) {
        this.items = items;
    }
      public synchronized void addProduct(Product product) {
        if(this.items == null){
            this.items = new ArrayList<>();
        }
        for (CartItem item : items) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + 1);
                item.setTotalPrice(item.getQuantity() * product.getPrice());
                return;
            }
        }
        items.add(new CartItem(1, product, 1, product.getPrice()));
    }

    public void updateQuantity(int productId, int quantity) {
        if (items == null) {
            return;
        }
        for (CartItem item : items) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(quantity);
                item.setTotalPrice(quantity * item.getProduct().getPrice());
                return;
            }
        }
    }

    public void removeProduct(int productId) {
        if (items == null) {
            return;
        }
        items.removeIf(item -> item.getProduct().getId() == productId);
    }

    
}
