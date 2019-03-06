package com.dio.guimei.vo.order;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * Created by wxk on 2018/8/31.
 */
public class TradeDetail implements Serializable {

    private Integer rn;
    private String trd_no;
    private String prod_no;
    private Integer saler;
    private Integer quantity;
    private Double discount_price;
    private Timestamp trd_time;

    public Integer getrn() {
        return rn;
    }

    public void setrn(Integer rn) {
        this.rn = rn;
    }

    public String getTrd_no() {
        return trd_no;
    }

    public void setTrd_no(String trd_no) {
        this.trd_no = trd_no;
    }

    public String getProd_no() {
        return prod_no;
    }

    public void setProd_no(String prod_no) {
        this.prod_no = prod_no;
    }

    public Integer getSaler() {
        return saler;
    }

    public void setSaler(Integer saler) {
        this.saler = saler;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getDiscount_price() {
        return discount_price;
    }

    public void setDiscount_price(Double discount_price) {
        this.discount_price = discount_price;
    }

    public Timestamp getTrd_time() {
        return trd_time;
    }

    public void setTrd_time(Timestamp trd_time) {
        this.trd_time = trd_time;
    }

    @Override
    public String toString() {
        return "TradeDetail{" +
                "rn=" + rn +
                ", trd_no='" + trd_no + '\'' +
                ", prod_no='" + prod_no + '\'' +
                ", saler=" + saler +
                ", quantity=" + quantity +
                ", discount_price=" + discount_price +
                '}';
    }


    public TradeDetail(String trd_no, String prod_no, Integer saler, Integer quantity, Double discount_price, Timestamp trd_time) {
        this.trd_no = trd_no;
        this.prod_no = prod_no;
        this.saler = saler;
        this.quantity = quantity;
        this.discount_price = discount_price;
        this.trd_time = trd_time;
    }

    public TradeDetail() {
    }
}
