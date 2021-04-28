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
public class ServiceInvoice {

    private int id;
    private int invoiceId;
    private int serviceId;
    private int amount;

    public ServiceInvoice() {
    }

    public ServiceInvoice(int invoiceId, int serviceId, int amount) {
        this.invoiceId = invoiceId;
        this.serviceId = serviceId;
        this.amount = amount;
    }

    public ServiceInvoice(int id, int invoiceId, int serviceId, int amount) {
        this.id = id;
        this.invoiceId = invoiceId;
        this.serviceId = serviceId;
        this.amount = amount;
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

    public int getServiceId() {
        return serviceId;
    }

    public void setServiceId(int serviceId) {
        this.serviceId = serviceId;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

}
