package com.dio.guimei.vo.tc;

import java.io.Serializable;
import java.sql.Date;

/**
 * Created by TCCCC on 2018/8/31/031.
 */
public class Salaprod implements Serializable {
    private  Integer id;
    private String prod_no;
    private  Integer saler_id;
    private  Integer stk_id;
    private Integer real_price;
    private  Integer carriage;
    private Date  star_time;
    private Date  end_time;
    private  String  prod_skin;
    private  String location;
    private  String prod_name;
    private  String image;
    private Integer lowId;
    private Integer hiId;

    public Salaprod(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Salaprod{" +
                "id=" + id +
                ", prod_no='" + prod_no + '\'' +
                ", saler_id=" + saler_id +
                ", stk_id=" + stk_id +
                ", real_price=" + real_price +
                ", carriage=" + carriage +
                ", star_time=" + star_time +
                ", end_time=" + end_time +
                ", prod_skin='" + prod_skin + '\'' +
                ", location='" + location + '\'' +
                ", prod_name='" + prod_name + '\'' +
                ", image='" + image + '\'' +
                '}';
    }


    public Salaprod(String prod_no, Integer saler_id, Integer stk_id, Integer real_price, Integer carriage, Date star_time, Date end_time, String prod_skin, String location, String prod_name, String image) {
        this.prod_no = prod_no;
        this.saler_id = saler_id;
        this.stk_id = stk_id;
        this.real_price = real_price;
        this.carriage = carriage;
        this.star_time = star_time;
        this.end_time = end_time;
        this.prod_skin = prod_skin;
        this.location = location;
        this.prod_name = prod_name;
        this.image = image;
    }

    public Salaprod(Integer id, String prod_no, Integer saler_id, Integer stk_id, Integer real_price, Integer carriage, Date star_time, Date end_time, String prod_skin, String location, String prod_name, String image) {
        this.id = id;
        this.prod_no = prod_no;
        this.saler_id = saler_id;
        this.stk_id = stk_id;
        this.real_price = real_price;
        this.carriage = carriage;
        this.star_time = star_time;
        this.end_time = end_time;
        this.prod_skin = prod_skin;
        this.location = location;
        this.prod_name = prod_name;
        this.image = image;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProd_no() {
        return prod_no;
    }

    public void setProd_no(String prod_no) {
        this.prod_no = prod_no;
    }

    public Integer getSaler_id() {
        return saler_id;
    }

    public void setSaler_id(Integer saler_id) {
        this.saler_id = saler_id;
    }

    public Integer getStk_id() {
        return stk_id;
    }

    public void setStk_id(Integer stk_id) {
        this.stk_id = stk_id;
    }

    public Integer getReal_price() {
        return real_price;
    }

    public void setReal_price(Integer real_price) {
        this.real_price = real_price;
    }

    public Integer getCarriage() {
        return carriage;
    }

    public void setCarriage(Integer carriage) {
        this.carriage = carriage;
    }

    public Date getStar_time() {
        return star_time;
    }

    public void setStar_time(Date star_time) {
        this.star_time = star_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public String getProd_skin() {
        return prod_skin;
    }

    public void setProd_skin(String prod_skin) {
        this.prod_skin = prod_skin;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
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

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Salaprod() {
    }

    public Salaprod(String prod_no, Integer saler_id, Integer stk_id, Integer real_price, Integer carriage, Date star_time, Date end_time, String prod_skin, String location) {
        this.prod_no = prod_no;
        this.saler_id = saler_id;
        this.stk_id = stk_id;
        this.real_price = real_price;
        this.carriage = carriage;
        this.star_time = star_time;
        this.end_time = end_time;
        this.prod_skin = prod_skin;
        this.location = location;
    }

    public Salaprod(Integer id, String prod_no, Integer saler_id, Integer stk_id, Integer real_price, Integer carriage, Date star_time, Date end_time, String prod_skin, String location) {
        this.id = id;
        this.prod_no = prod_no;
        this.saler_id = saler_id;
        this.stk_id = stk_id;
        this.real_price = real_price;
        this.carriage = carriage;
        this.star_time = star_time;
        this.end_time = end_time;
        this.prod_skin = prod_skin;
        this.location = location;
    }


}
