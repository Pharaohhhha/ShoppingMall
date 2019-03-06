package com.dio.guimei.vo.wt;

import java.io.Serializable;

/**
 * @author 王涛
 * @Created by WT on 2018/8/31.
 */
public class Admin implements Serializable {
    private Integer user_Id;
    private String login_Name;
    private String password;
    private String address;
    private String email;
    private String phone;
    private String profile;
    private String image;


    @Override
    public String toString() {
        return "Admin{" +
                "user_Id=" + user_Id +
                ", login_Name='" + login_Name + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", profile='" + profile + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(Integer user_Id) {
        this.user_Id = user_Id;
    }

    public String getLogin_Name() {
        return login_Name;
    }

    public void setLogin_Name(String login_Name) {
        this.login_Name = login_Name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Admin(Integer user_Id, String login_Name, String password, String address, String email, String phone, String profile, String image) {
        this.user_Id = user_Id;
        this.login_Name = login_Name;
        this.password = password;
        this.address = address;
        this.email = email;
        this.phone = phone;
        this.profile = profile;
        this.image = image;
    }

    public Admin() {
    }
}
