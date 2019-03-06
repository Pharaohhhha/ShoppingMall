package com.dio.guimei.vo.order;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by wxk on 2018/8/31.
 */
public class Trade_Info implements Serializable {
    private String trd_no;
    private Integer buyer;
    private Double total_money;
    private Date    trd_time;
    private String trd_loc;
    private String  receiver;
    private String  phone;

    public Trade_Info() {
    }


    public String getTrd_no() {
        return trd_no;
    }

    public void setTrd_no(String trd_no) {
        this.trd_no = trd_no;
    }

    public Integer getBuyer() {
        return buyer;
    }

    public void setBuyer(Integer buyer) {
        this.buyer = buyer;
    }

    public Double getTotal_money() {
        return total_money;
    }

    public void setTotal_money(Double total_money) {
        this.total_money = total_money;
    }

    public Date getTrd_time() {
        return trd_time;
    }

    public void setTrd_time(Date trd_time) {
        this.trd_time = trd_time;
    }

    public String getTrd_loc() {
        return trd_loc;
    }

    public void setTrd_loc(String trd_loc) {
        this.trd_loc = trd_loc;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Trade_Info{" +
                "trd_no='" + trd_no + '\'' +
                ", buyer=" + buyer +
                ", total_money=" + total_money +
                ", trd_time=" + trd_time +
                ", trd_loc='" + trd_loc + '\'' +
                ", receiver='" + receiver + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
