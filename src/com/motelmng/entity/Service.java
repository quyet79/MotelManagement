/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.motelmng.entity;

/**
 *
 * @author hungn
 */
public class Service {

    private int id;
    private String name;
    private double price;
    private String describe;
    private boolean status;
    private int serviceTypeId;

    public Service() {
    }

    public Service(String name, double price, String describe, boolean status, int serviceTypeId) {
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.status = status;
        this.serviceTypeId = serviceTypeId;
    }

    public Service(int id, String name, double price, String describe, boolean status, int serviceTypeId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.status = status;
        this.serviceTypeId = serviceTypeId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getServiceTypeId() {
        return serviceTypeId;
    }

    public void setServiceTypeId(int serviceTypeId) {
        this.serviceTypeId = serviceTypeId;
    }

}
