package com.shoes.entity;

import java.io.Serializable;

public class ProductSize implements Serializable {
    private static final long serialVersionUID = -635035597928887618L;

    /**
     * This field corresponds to the database column product_size.ps_id
     */
    private Integer psId = 0;

    /**
     * This field corresponds to the database column product_size.size
     * 尺码
     */
    private Integer size = 0;

    /**
     * This field corresponds to the database column product_size.repertory
     * 尺码对应库存
     */
    private Integer repertory = 0;

    /**
     * This field corresponds to the database column product_size.product_id
     * 对应的产品id
     */
    private Integer productId = 0;

    /**
     * This method returns the value of the database column product_size.ps_id
     *
     * @return the value of product_size.ps_id
     */
    public Integer getPsId() {
        return psId;
    }

    /**
     * This method sets the value of the database column product_size.ps_id
     *
     * @param psId the value for product_size.ps_id
     */
    public void setPsId(Integer psId) {
        this.psId = psId;
    }

    /**
     * This method returns the value of the database column product_size.size
     *
     * @return the value of product_size.size
     */
    public Integer getSize() {
        return size;
    }

    /**
     * This method sets the value of the database column product_size.size
     *
     * @param size the value for product_size.size
     */
    public void setSize(Integer size) {
        this.size = size;
    }

    /**
     * This method returns the value of the database column product_size.repertory
     *
     * @return the value of product_size.repertory
     */
    public Integer getRepertory() {
        return repertory;
    }

    /**
     * This method sets the value of the database column product_size.repertory
     *
     * @param repertory the value for product_size.repertory
     */
    public void setRepertory(Integer repertory) {
        this.repertory = repertory;
    }

    /**
     * This method returns the value of the database column product_size.product_id
     *
     * @return the value of product_size.product_id
     */
    public Integer getProductId() {
        return productId;
    }

    /**
     * This method sets the value of the database column product_size.product_id
     *
     * @param productId the value for product_size.product_id
     */
    public void setProductId(Integer productId) {
        this.productId = productId;
    }
}