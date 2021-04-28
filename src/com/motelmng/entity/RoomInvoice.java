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
public class RoomInvoice {

    private int id;
    private int invoiceId;
    private String roomNumber;

    public RoomInvoice() {
    }

    public RoomInvoice(int invoiceId, String roomNumber) {
        this.invoiceId = invoiceId;
        this.roomNumber = roomNumber;
    }

    public RoomInvoice(int id, int invoiceId, String roomNumber) {
        this.id = id;
        this.invoiceId = invoiceId;
        this.roomNumber = roomNumber;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

}
