package com.dio.guimei.vo.UserManagerVo;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by CBS on 2018/8/31.
 */
public class Users implements Serializable {
    private Integer user_id;
    private String login_name;
    private String password;
    private String first_name;
    private String last_name;
    private String email;
    private String gender;
    private String header="images/header/defaultHeader.png";
    private String hobbit;
    private Date birthday;
    private Integer state = 1;

    public Users() {
    }

    public Users(Integer user_id, String login_name, String password, String first_name, String last_name, String email, String gender, String header, String hobbit, Date birthday, Integer state) {
        this.user_id = user_id;
        this.login_name = login_name;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.gender = gender;
        this.header = header;
        this.hobbit = hobbit;
        this.birthday = birthday;
        this.state = state;
    }

    public Users(Integer user_id, String login_name, String password, String first_name, String last_name, String email, String gender, String hobbit, Date birthday) {
        this.user_id = user_id;
        this.login_name = login_name;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.gender = gender;
        this.hobbit = hobbit;
        this.birthday = birthday;
    }

    public Users(Integer user_id, String password, String email, String header, String hobbit) {
        this.user_id = user_id;
        this.password = password;
        this.email = email;
        this.header = header;
        this.hobbit = hobbit;
    }

    public Users(String login_name, String password, String first_name, String last_name, String email, String gender, String header, String hobbit, Date birthday) {
        this.login_name = login_name;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.gender = gender;
        this.header = header;
        this.hobbit = hobbit;
        this.birthday = birthday;
    }

    public Users(String login_name, String password, String first_name, String last_name, String email, String gender, String header, String hobbit) {
        this.login_name = login_name;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.gender = gender;
        this.header = header;
        this.hobbit = hobbit;
    }

    public Users(Integer user_id,
                 String login_name,
                 String password,
                 String first_name,
                 String last_name,
                 String email,
                 String gender,
                 String header,
                 String hobbit,
                 Date birthday) {
        this.user_id = user_id;
        this.login_name = login_name;
        this.password = password;
        this.first_name = first_name;
        this.last_name = last_name;
        this.email = email;
        this.gender = gender;
        this.header = header;
        this.hobbit = hobbit;
        this.birthday = birthday;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
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

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getHeader() {
        return header;
    }

    public void setHeader(String header) {
        this.header = header;
    }

    public String getHobbit() {
        return hobbit;
    }

    public void setHobbit(String hobbit) {
        this.hobbit = hobbit;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Users{" +
                "user_id=" + user_id +
                ", login_name='" + login_name + '\'' +
                ", password='" + password + '\'' +
                ", first_name='" + first_name + '\'' +
                ", last_name='" + last_name + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", header='" + header + '\'' +
                ", hobbit='" + hobbit + '\'' +
                ", birthday=" + birthday +
                '}';
    }
}
