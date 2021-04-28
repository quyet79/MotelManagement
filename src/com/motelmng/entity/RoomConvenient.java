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
public class RoomConvenient {

    private int id;
    private String roomNumber;
    private int convenientId;
    private int amount;
    private String status;

    public RoomConvenient() {
    }

    public RoomConvenient(String roomNumber, int convenientId, int amount, String status) {
        this.roomNumber = roomNumber;
        this.convenientId = convenientId;
        this.amount = amount;
        this.status = status;
    }

    public RoomConvenient(int id, String roomNumber, int convenientId, int amount, String status) {
        this.id = id;
        this.roomNumber = roomNumber;
        this.convenientId = convenientId;
        this.amount = amount;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getConvenientId() {
        return convenientId;
    }

    public void setConvenientId(int convenientId) {
        this.convenientId = convenientId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
