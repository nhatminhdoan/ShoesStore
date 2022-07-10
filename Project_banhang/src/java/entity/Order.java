/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author dattrinh
 */
public class Order {
    private int id;
    private String cusName,phone;
    private double total;
    private int userid;
    private Date date;

    public void setId(int id) {
        this.id = id;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public String getCusName() {
        return cusName;
    }

    public String getPhone() {
        return phone;
    }

    public double getTotal() {
        return total;
    }

    public int getUserid() {
        return userid;
    }

    public Date getDate() {
        return date;
    }
    
}
