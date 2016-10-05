package com.shoes.entity;

import java.io.Serializable;

public class Product implements Serializable {
    private static final long serialVersionUID = -2467891072834692673L;

    /**
     * This field corresponds to the database column product.id
     */
    private Integer id = 0;

    /**
     * This field corresponds to the database column product.title
     * 产品标题
     */
    private String title;

    /**
     * This field corresponds to the database column product.brand_id
     * 产品品牌id
     */
    private Integer brandId = 0;

    /**
     * This field corresponds to the database column product.type_id
     * 鞋子属性（1表示女鞋，2表示男鞋，3表示童鞋）
     */
    private Integer typeId = 0;

    /**
     * This field corresponds to the database column product.hot
     * 热卖，1表示普通，2表示热卖
     */
    private Integer hot = 1;

    /**
     * This field corresponds to the database column product.main_img
     * 海报图，可以没有
     */
    private String mainImg;

    /**
     * This field corresponds to the database column product.first_img
     */
    private String firstImg;

    /**
     * This field corresponds to the database column product.second_img
     */
    private String secondImg;

    /**
     * This field corresponds to the database column product.third_img
     */
    private String thirdImg;

    /**
     * This field corresponds to the database column product.last_price
     * 原价
     */
    private Double lastPrice;

    /**
     * This field corresponds to the database column product.now_price
     * 现价
     */
    private Double nowPrice;

    /**
     * This field corresponds to the database column product.saled
     * 销量
     */
    private Integer saled = 0;

    /**
     * This field corresponds to the database column product.summary
     * 产品描述
     */
    private String summary;

    /**
     * This method returns the value of the database column product.id
     *
     * @return the value of product.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method sets the value of the database column product.id
     *
     * @param id the value for product.id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method returns the value of the database column product.title
     *
     * @return the value of product.title
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method sets the value of the database column product.title
     *
     * @param title the value for product.title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * This method returns the value of the database column product.brand_id
     *
     * @return the value of product.brand_id
     */
    public Integer getBrandId() {
        return brandId;
    }

    /**
     * This method sets the value of the database column product.brand_id
     *
     * @param brandId the value for product.brand_id
     */
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    /**
     * This method returns the value of the database column product.type_id
     *
     * @return the value of product.type_id
     */
    public Integer getTypeId() {
        return typeId;
    }

    /**
     * This method sets the value of the database column product.type_id
     *
     * @param typeId the value for product.type_id
     */
    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    /**
     * This method returns the value of the database column product.hot
     *
     * @return the value of product.hot
     */
    public Integer getHot() {
        return hot;
    }

    /**
     * This method sets the value of the database column product.hot
     *
     * @param hot the value for product.hot
     */
    public void setHot(Integer hot) {
        this.hot = hot;
    }

    /**
     * This method returns the value of the database column product.main_img
     *
     * @return the value of product.main_img
     */
    public String getMainImg() {
        return mainImg;
    }

    /**
     * This method sets the value of the database column product.main_img
     *
     * @param mainImg the value for product.main_img
     */
    public void setMainImg(String mainImg) {
        this.mainImg = mainImg;
    }

    /**
     * This method returns the value of the database column product.first_img
     *
     * @return the value of product.first_img
     */
    public String getFirstImg() {
        return firstImg;
    }

    /**
     * This method sets the value of the database column product.first_img
     *
     * @param firstImg the value for product.first_img
     */
    public void setFirstImg(String firstImg) {
        this.firstImg = firstImg;
    }

    /**
     * This method returns the value of the database column product.second_img
     *
     * @return the value of product.second_img
     */
    public String getSecondImg() {
        return secondImg;
    }

    /**
     * This method sets the value of the database column product.second_img
     *
     * @param secondImg the value for product.second_img
     */
    public void setSecondImg(String secondImg) {
        this.secondImg = secondImg;
    }

    /**
     * This method returns the value of the database column product.third_img
     *
     * @return the value of product.third_img
     */
    public String getThirdImg() {
        return thirdImg;
    }

    /**
     * This method sets the value of the database column product.third_img
     *
     * @param thirdImg the value for product.third_img
     */
    public void setThirdImg(String thirdImg) {
        this.thirdImg = thirdImg;
    }

    /**
     * This method returns the value of the database column product.last_price
     *
     * @return the value of product.last_price
     */
    public Double getLastPrice() {
        return lastPrice;
    }

    /**
     * This method sets the value of the database column product.last_price
     *
     * @param lastPrice the value for product.last_price
     */
    public void setLastPrice(Double lastPrice) {
        this.lastPrice = lastPrice;
    }

    /**
     * This method returns the value of the database column product.now_price
     *
     * @return the value of product.now_price
     */
    public Double getNowPrice() {
        return nowPrice;
    }

    /**
     * This method sets the value of the database column product.now_price
     *
     * @param nowPrice the value for product.now_price
     */
    public void setNowPrice(Double nowPrice) {
        this.nowPrice = nowPrice;
    }

    /**
     * This method returns the value of the database column product.saled
     *
     * @return the value of product.saled
     */
    public Integer getSaled() {
        return saled;
    }

    /**
     * This method sets the value of the database column product.saled
     *
     * @param saled the value for product.saled
     */
    public void setSaled(Integer saled) {
        this.saled = saled;
    }

    /**
     * This method returns the value of the database column product.summary
     *
     * @return the value of product.summary
     */
    public String getSummary() {
        return summary;
    }

    /**
     * This method sets the value of the database column product.summary
     *
     * @param summary the value for product.summary
     */
    public void setSummary(String summary) {
        this.summary = summary;
    }
}