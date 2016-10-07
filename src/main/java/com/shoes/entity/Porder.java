package com.shoes.entity;

import java.io.Serializable;
import java.util.Date;

public class Porder implements Serializable {
    private static final long serialVersionUID = -4737917488351444633L;

    /**
     * This field corresponds to the database column p_order.id
     */
    private Integer id = 0;

    /**
     * This field corresponds to the database column p_order.order_id
     */
    private String orderId;

    /**
     * This field corresponds to the database column p_order.p_id
     */
    private Integer pid = 0;

    /**
     * This field corresponds to the database column p_order.ps_id
     */
    private Integer psid = 0;

    /**
     * This field corresponds to the database column p_order.product_num
     * �µ���Ʒ����
     */
    private Integer productNum = 0;

    /**
     * This field corresponds to the database column p_order.begin_time
     */
    private Date beginTime = new Date();

    /**
     * This field corresponds to the database column p_order.pay_time
     * ����ʱ��
     */
    private Date payTime = new Date();

    /**
     * This field corresponds to the database column p_order.finsh_time
     */
    private Date finshTime = new Date();

    /**
     * This field corresponds to the database column p_order.status
     * 0:δ���1���Ѹ����ȷ���ջ���2������ɣ�3���ѹر�
     */
    private Integer status = 0;

    /**
     * This field corresponds to the database column p_order.user_id
     * �����û�id
     */
    private Integer userId = 0;

    /**
     * This method returns the value of the database column p_order.id
     *
     * @return the value of p_order.id
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method sets the value of the database column p_order.id
     *
     * @param id the value for p_order.id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method returns the value of the database column p_order.order_id
     *
     * @return the value of p_order.order_id
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * This method sets the value of the database column p_order.order_id
     *
     * @param orderId the value for p_order.order_id
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * This method returns the value of the database column p_order.p_id
     *
     * @return the value of p_order.p_id
     */
    public Integer getPid() {
        return pid;
    }

    /**
     * This method sets the value of the database column p_order.p_id
     *
     * @param pid the value for p_order.p_id
     */
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    /**
     * This method returns the value of the database column p_order.ps_id
     *
     * @return the value of p_order.ps_id
     */
    public Integer getPsid() {
        return psid;
    }

    /**
     * This method sets the value of the database column p_order.ps_id
     *
     * @param psid the value for p_order.ps_id
     */
    public void setPsid(Integer psid) {
        this.psid = psid;
    }

    /**
     * This method returns the value of the database column p_order.product_num
     *
     * @return the value of p_order.product_num
     */
    public Integer getProductNum() {
        return productNum;
    }

    /**
     * This method sets the value of the database column p_order.product_num
     *
     * @param productNum the value for p_order.product_num
     */
    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    /**
     * This method returns the value of the database column p_order.begin_time
     *
     * @return the value of p_order.begin_time
     */
    public Date getBeginTime() {
        return beginTime;
    }

    /**
     * This method sets the value of the database column p_order.begin_time
     *
     * @param beginTime the value for p_order.begin_time
     */
    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    /**
     * This method returns the value of the database column p_order.pay_time
     *
     * @return the value of p_order.pay_time
     */
    public Date getPayTime() {
        return payTime;
    }

    /**
     * This method sets the value of the database column p_order.pay_time
     *
     * @param payTime the value for p_order.pay_time
     */
    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    /**
     * This method returns the value of the database column p_order.finsh_time
     *
     * @return the value of p_order.finsh_time
     */
    public Date getFinshTime() {
        return finshTime;
    }

    /**
     * This method sets the value of the database column p_order.finsh_time
     *
     * @param finshTime the value for p_order.finsh_time
     */
    public void setFinshTime(Date finshTime) {
        this.finshTime = finshTime;
    }

    /**
     * This method returns the value of the database column p_order.status
     *
     * @return the value of p_order.status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method sets the value of the database column p_order.status
     *
     * @param status the value for p_order.status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method returns the value of the database column p_order.user_id
     *
     * @return the value of p_order.user_id
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method sets the value of the database column p_order.user_id
     *
     * @param userId the value for p_order.user_id
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}