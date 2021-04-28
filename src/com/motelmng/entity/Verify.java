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
public class Verify {

    private int id;
    private String code;
    private String staffId;
    private Timestamp createAt;

    public Verify() {
    }

    public Verify(String code, String staffId, Timestamp createAt) {
        this.code = code;
        this.staffId = staffId;
        this.createAt = createAt;
    }

    public Verify(int id, String code, String staffId, Timestamp createAt) {
        this.id = id;
        this.code = code;
        this.staffId = staffId;
        this.createAt = createAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

}
