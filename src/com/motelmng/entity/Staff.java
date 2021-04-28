/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.motelmng.entity;

import java.util.Date;

/**
 *
 * @author hungn
 */
public class Staff {

    private int id;
    private String name;
    private String password;
    private Date dob;
    private boolean gender;
    private String address;
    private String phone;
    private String email;
    private String avatar;
    private int departmentId;

    public Staff() {
    }

    public Staff(String name, String password, Date dob, boolean gender, String address, String phone, String email, String avatar, int departmentId) {
        this.name = name;
        this.password = password;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.avatar = avatar;
        this.departmentId = departmentId;
    }

    public Staff(int id, String name, String password, Date dob, boolean gender, String address, String phone, String email, String avatar, int departmentId) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.dob = dob;
        this.gender = gender;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.avatar = avatar;
        this.departmentId = departmentId;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

}
