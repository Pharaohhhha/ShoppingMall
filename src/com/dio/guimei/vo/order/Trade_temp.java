package com.dio.guimei.vo.order;

import java.io.Serializable;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by wxk on 2018/9/1.
 */
public class Trade_temp implements Serializable {
    private String login_name;
    private Timestamp trd_time;
    private String trd_loc;
    private String receiver;
    private String  phone;
    public Trade_temp() {
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public Timestamp getTrd_time() {
        return trd_time;
    }

    public void setTrd_time(Timestamp trd_time) {
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
        return "Trade_temp{" +
                "login_name='" + login_name + '\'' +
                ", trd_time=" + trd_time +
                ", trd_loc='" + trd_loc + '\'' +
                ", receiver='" + receiver + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
