package com.dio.guimei.vo.UserManagerVo;

import java.io.Serializable;

/**
 * Created by CBS on 2018/8/31.
 */
public class Admin implements Serializable {

        private Integer userId;
        private String login_name;
        private String password;

    public Admin() {
    }

    public Admin(String login_name, String password) {
        this.login_name = login_name;
        this.password = password;
    }

    public Admin(Integer userId, String login_name, String password) {
        this.userId = userId;
        this.login_name = login_name;
        this.password = password;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "userId=" + userId +
                ", login_name='" + login_name + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}

