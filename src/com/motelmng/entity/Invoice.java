/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.motelmng.entity;

import java.sql.Timestamp;

/**
 *
 * @author hungn
 */
public class Invoice {

    private int id;
    private Timestamp rentDate;
    private Timestamp payDate;
    private double total;
    private boolean status;
    private int priceTypeId;
    private int customerId;
    private String staffId;

    public Invoice() {
    }

    public Invoice(Timestamp rentDate, Timestamp payDate, double total, boolean status, int priceTypeId, int customerId, String staffId) {
        this.rentDate = rentDate;
        this.payDate = payDate;
        this.total = total;
        this.status = status;
        this.priceTypeId = priceTypeId;
        this.customerId = customerId;
        this.staffId = staffId;
    }

    public Invoice(int id, Timestamp rentDate, Timestamp payDate, double total, boolean status, int priceTypeId, int customerId, String staffId) {
        this.id = id;
        this.rentDate = rentDate;
        this.payDate = payDate;
        this.total = total;
        this.status = status;
        this.priceTypeId = priceTypeId;
        this.customerId = customerId;
        this.staffId = staffId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getRentDate() {
        return rentDate;
    }

    public void setRentDate(Timestamp rentDate) {
        this.rentDate = rentDate;
    }

    public Timestamp getPayDate() {
        return payDate;
    }

    public void setPayDate(Timestamp payDate) {
        this.payDate = payDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getPriceTypeId() {
        return priceTypeId;
    }

    public void setPriceTypeId(int priceTypeId) {
        this.priceTypeId = priceTypeId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

}
