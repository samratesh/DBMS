package com.project.medical.Models;
import java.sql.Timestamp;

public class Order {
    private int ORDER_ID;
    private int USER_ID;
    private int PRODUCT_ID;
    private Timestamp ORDER_TIME;
    private String ORDER_STATUS;

    public int getORDER_ID() {
        return ORDER_ID;
    }

    public void setORDER_ID(int ORDER_ID) {
        this.ORDER_ID = ORDER_ID;
    }

    public int getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(int USER_ID) {
        this.USER_ID = USER_ID;
    }

    public int getPRODUCT_ID() {
        return PRODUCT_ID;
    }

    public void setPRODUCT_ID(int PRODUCT_ID) {
        this.PRODUCT_ID = PRODUCT_ID;
    }

    public Timestamp getORDER_TIME() {
        return ORDER_TIME;
    }

    public void setORDER_TIME(Timestamp ORDER_TIME) {
        this.ORDER_TIME = ORDER_TIME;
    }

    public String getORDER_STATUS() {
        return ORDER_STATUS;
    }

    public void setORDER_STATUS(String ORDER_STATUS) {
        this.ORDER_STATUS = ORDER_STATUS;
    }
}
