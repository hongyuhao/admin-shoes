package com.shoes.entity;

import java.io.Serializable;

public class User implements Serializable {
    private static final long serialVersionUID = -645246654630758992L;

    /**
     * This field corresponds to the database column user.id
     */
    private Integer id = 0;

    /**
     * This field corresponds to the database column user.username
     */
    private String username;

    /**
     * This field corresponds to the database column user.password
     */
    private String password;

    /**
     * This field corresponds to the database column user.realname
     * 真实姓名
     */
    private String realname;

    /**
     * This field corresponds to the database column user.identity
     * 身份证
     */
    private String identity;

    /**
     * This field corresponds to the database column user.usertype
     * 用户类型（0代表最高权限，1代表普通管理员，2代表用户）
     */
    private Integer usertype = 2;

    /**
     * This field corresponds to the database column user.balance
     * 账户余额
     */
    private Double balance = 0.0;

    /**
     * This method returns the value of the database column user.id
     *
     * @return the value of user.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method sets the value of the database column user.id
     *
     * @param id the value for user.id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method returns the value of the database column user.username
     *
     * @return the value of user.username
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method sets the value of the database column user.username
     *
     * @param username the value for user.username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * This method returns the value of the database column user.password
     *
     * @return the value of user.password
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method sets the value of the database column user.password
     *
     * @param password the value for user.password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * This method returns the value of the database column user.realname
     *
     * @return the value of user.realname
     */
    public String getRealname() {
        return realname;
    }

    /**
     * This method sets the value of the database column user.realname
     *
     * @param realname the value for user.realname
     */
    public void setRealname(String realname) {
        this.realname = realname;
    }

    /**
     * This method returns the value of the database column user.identity
     *
     * @return the value of user.identity
     */
    public String getIdentity() {
        return identity;
    }

    /**
     * This method sets the value of the database column user.identity
     *
     * @param identity the value for user.identity
     */
    public void setIdentity(String identity) {
        this.identity = identity;
    }

    /**
     * This method returns the value of the database column user.usertype
     *
     * @return the value of user.usertype
     */
    public Integer getUsertype() {
        return usertype;
    }

    /**
     * This method sets the value of the database column user.usertype
     *
     * @param usertype the value for user.usertype
     */
    public void setUsertype(Integer usertype) {
        this.usertype = usertype;
    }

    /**
     * This method returns the value of the database column user.balance
     *
     * @return the value of user.balance
     */
    public Double getBalance() {
        return balance;
    }

    /**
     * This method sets the value of the database column user.balance
     *
     * @param balance the value for user.balance
     */
    public void setBalance(Double balance) {
        this.balance = balance;
    }
}