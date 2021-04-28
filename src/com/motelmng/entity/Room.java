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
public class Room {

    private String number;
    private int capacity;
    private boolean status;
    private int roomTypeId;

    public Room() {
    }

    public Room(int capacity, boolean status, int roomTypeId) {
        this.capacity = capacity;
        this.status = status;
        this.roomTypeId = roomTypeId;
    }

    public Room(String number, int capacity, boolean status, int roomTypeId) {
        this.number = number;
        this.capacity = capacity;
        this.status = status;
        this.roomTypeId = roomTypeId;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getRoomTypeId() {
        return roomTypeId;
    }

    public void setRoomTypeId(int roomTypeId) {
        this.roomTypeId = roomTypeId;
    }

}
