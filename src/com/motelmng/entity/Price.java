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
public class Price {

    private int id;
    private int roomTypeId;
    private int priceTypeId;
    private double priceValue;

    public Price() {
    }

    public Price(int roomTypeId, int priceTypeId, double priceValue) {
        this.roomTypeId = roomTypeId;
        this.priceTypeId = priceTypeId;
        this.priceValue = priceValue;
    }

    public Price(int id, int roomTypeId, int priceTypeId, double priceValue) {
        this.id = id;
        this.roomTypeId = roomTypeId;
        this.priceTypeId = priceTypeId;
        this.priceValue = priceValue;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

    public int getPriceTypeId() {
        return priceTypeId;
    }

    public void setPriceTypeId(int priceTypeId) {
        this.priceTypeId = priceTypeId;
    }

    public double getPriceValue() {
        return priceValue;
    }

    public void setPriceValue(double priceValue) {
        this.priceValue = priceValue;
    }

}
