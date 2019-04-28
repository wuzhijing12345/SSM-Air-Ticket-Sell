package com.pojo;

import org.apache.ibatis.annotations.Param;

public class User {
    private long userId;
    private String password;
    private String username;
    private String telnumber;
    private double money;
    private String error;
    private String error1;

    public User(){
        userId=0;
        money=0;
    }
    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId=userId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTelnumber() {
        return telnumber;
    }

    public void setTelnumber(String telnumber) {
        this.telnumber = telnumber;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money=money;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public String getError1() {
        return error1;
    }

    public void setError1(String error1) {
        this.error1 = error1;
    }
}
