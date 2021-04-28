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
public class Customer {

    private int id;
    private String name;
    private String idCard;
    private String phone;
    private boolean gender;
    private String address;
    private String nation;

    public Customer() {
    }

    public Customer(String name, String idCard, String phone, boolean gender, String address, String nation) {
        this.name = name;
        this.idCard = idCard;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.nation = nation;
    }

    public Customer(int id, String name, String idCard, String phone, boolean gender, String address, String nation) {
        this.id = id;
        this.name = name;
        this.idCard = idCard;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.nation = nation;
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

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

}
