package com.solvd.onlinemarket.onmarket;

import java.time.LocalDateTime;
import java.util.List;

public class Order {

    private Long ID;
    private double totalPrice;
    private boolean isPaid;
    private LocalDateTime createdAtDate;
    private List<Product> products;

    public Order() {
    }

    public Long getID() {
        return ID;
    }

    public void setID(Long ID) {
        this.ID = ID;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean isPaid() {
        return isPaid;
    }

    public void setPaid(boolean paid) {
        isPaid = paid;
    }

    public LocalDateTime getCreatedAtDate() {
        return createdAtDate;
    }

    public void setCreatedAtDate(LocalDateTime createdAtDate) {
        this.createdAtDate = createdAtDate;
    }
}
