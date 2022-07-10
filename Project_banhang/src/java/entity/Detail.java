/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author dattrinh
 */
public class Detail {
    private int productID,orderID;
    private double price;
    private int quantity;

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getProductID() {
        return productID;
    }

    public int getOrderID() {
        return orderID;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public Detail(int productID, int orderID, double price, int quantity) {
        this.productID = productID;
        this.orderID = orderID;
        this.price = price;
        this.quantity = quantity;
    }
    
}
