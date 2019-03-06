package com.dio.guimei.vo.finishedFoodVo;

import oracle.sql.DATE;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by 123 on 2018/8/31.
 */
public class FinishedGood implements Serializable {
    private Integer stk_id;
    private String stk_name;
    private Integer quantity;
    private java.sql.Date in_stk_date;
    private java.sql.Date out_stk_date;
    private Integer lowId;
    private Integer hiId;
    private Integer state = 1;

    public FinishedGood() {
    }

    public FinishedGood(Integer stk_id, String stk_name, Integer quantity, java.sql.Date in_stk_date, java.sql.Date out_stk_date) {
        this.stk_id = stk_id;
        this.stk_name = stk_name;
        this.quantity = quantity;
        this.in_stk_date = in_stk_date;
        this.out_stk_date = out_stk_date;
    }

    public FinishedGood(Integer stk_id, String stk_name, Integer quantity, java.sql.Date in_stk_date, java.sql.Date out_stk_date, Integer lowId, Integer hiId, Integer state) {
        this.stk_id = stk_id;
        this.stk_name = stk_name;
        this.quantity = quantity;
        this.in_stk_date = in_stk_date;
        this.out_stk_date = out_stk_date;
        this.lowId = lowId;
        this.hiId = hiId;
        this.state = state;
    }

    public Integer getStk_id() {
        return stk_id;
    }

    public void setStk_id(Integer stk_id) {
        this.stk_id = stk_id;
    }

    public String getStk_name() {
        return stk_name;
    }

    public void setStk_name(String stk_name) {
        this.stk_name = stk_name;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public java.sql.Date getIn_stk_date() {
        return in_stk_date;
    }

    public void setIn_stk_date(java.sql.Date in_stk_date) {
        this.in_stk_date = in_stk_date;
    }

    public java.sql.Date getOut_stk_date() {
        return out_stk_date;
    }

    public void setOut_stk_date(java.sql.Date out_stk_date) {
        this.out_stk_date = out_stk_date;
    }

    public Integer getLowId() {
        return lowId;
    }

    public void setLowId(Integer lowId) {
        this.lowId = lowId;
    }

    public Integer getHiId() {
        return hiId;
    }

    public void setHiId(Integer hiId) {
        this.hiId = hiId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "FinishedGood{" +
                "stk_id=" + stk_id +
                ", stk_name='" + stk_name + '\'' +
                ", quantity=" + quantity +
                ", in_stk_date=" + in_stk_date +
                ", out_stk_date=" + out_stk_date +
                '}';
    }
}
