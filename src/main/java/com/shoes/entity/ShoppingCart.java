package com.shoes.entity;

import java.io.Serializable;

public class ShoppingCart implements Serializable {
    private static final long serialVersionUID = -3662450925309071168L;

    /**
     * This field corresponds to the database column shopping_cart.id
     */
    private Integer id = 0;

    /**
     * This field corresponds to the database column shopping_cart.p_id
     * 产品id
     */
    private Integer pid = 0;

    /**
     * This field corresponds to the database column shopping_cart.ps_id
     * 对应尺寸id
     */
    private Integer psid = 0;

    /**
     * This field corresponds to the database column shopping_cart.cart_num
     * 加入购物车数量
     */
    private Integer cartNum = 0;

    /**
     * This field corresponds to the database column shopping_cart.user_id
     */
    private Integer userId = 0;

    /**
     * This method returns the value of the database column shopping_cart.id
     *
     * @return the value of shopping_cart.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method sets the value of the database column shopping_cart.id
     *
     * @param id the value for shopping_cart.id
     */
    public void setId(Integer id) {
        this.id = id;
    }

   /**
     * This method returns the value of the database column shopping_cart.cart_num
     *
     * @return the value of shopping_cart.cart_num
     */
    public Integer getCartNum() {
        return cartNum;
    }

    /**
     * This method sets the value of the database column shopping_cart.cart_num
     *
     * @param cartNum the value for shopping_cart.cart_num
     */
    public void setCartNum(Integer cartNum) {
        this.cartNum = cartNum;
    }

    /**
     * This method returns the value of the database column shopping_cart.user_id
     *
     * @return the value of shopping_cart.user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method sets the value of the database column shopping_cart.user_id
     *
     * @param userId the value for shopping_cart.user_id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPsid() {
        return psid;
    }

    public void setPsid(Integer psid) {
        this.psid = psid;
    }
}