package com.shoes.entity;

import java.io.Serializable;

public class Brand implements Serializable {
    private static final long serialVersionUID = -3697016493234786688L;

    /**
     * This field corresponds to the database column brand.brand_id
     */
    private Integer brandId = 0;

    /**
     * This field corresponds to the database column brand.brand_name
     * 品牌名字
     */
    private String brandName;

    /**
     * This field corresponds to the database column brand.brand_icon
     * 品牌图标
     */
    private String brandIcon;

    /**
     * This method returns the value of the database column brand.brand_id
     *
     * @return the value of brand.brand_id
     */
    public Integer getBrandId() {
        return brandId;
    }

    /**
     * This method sets the value of the database column brand.brand_id
     *
     * @param brandId the value for brand.brand_id
     */
    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    /**
     * This method returns the value of the database column brand.brand_name
     *
     * @return the value of brand.brand_name
     */
    public String getBrandName() {
        return brandName;
    }

    /**
     * This method sets the value of the database column brand.brand_name
     *
     * @param brandName the value for brand.brand_name
     */
    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    /**
     * This method returns the value of the database column brand.brand_icon
     *
     * @return the value of brand.brand_icon
     */
    public String getBrandIcon() {
        return brandIcon;
    }

    /**
     * This method sets the value of the database column brand.brand_icon
     *
     * @param brandIcon the value for brand.brand_icon
     */
    public void setBrandIcon(String brandIcon) {
        this.brandIcon = brandIcon;
    }
}