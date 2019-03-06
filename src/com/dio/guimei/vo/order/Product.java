package com.dio.guimei.vo.order;

import java.io.Serializable;

/**
 * Created by wxk on 2018/9/1.
 */
public class Product implements Serializable {
    private String prod_no;
    private Integer ctgr_id;
    private Integer ven_id;
    private Integer stk_id;
    private String  prod_name;
    private Double  price;
    private String  type;
    private String  descr;
    private String  image;
    private Integer state = 1;
   /* IMAGE,PROD_NAME,PRICE,TYPE,DESCR,CTGR_ID,VEN_ID,STK_ID*/

    public Product() {
    }

    public Product(String image, String prod_name, Double price, String type, String descr, Integer ctgr_id, Integer ven_id, Integer stk_id,String prod_no   ) {

        this.ctgr_id = ctgr_id;
        this.ven_id = ven_id;
        this.stk_id = stk_id;
        this.prod_name = prod_name;
        this.price = price;
        this.type = type;
        this.descr = descr;
        this.image = image;
        this.prod_no=prod_no;
    }

    public Product(String prod_no, Integer ctgr_id, Integer ven_id, Integer stk_id, String prod_name, Double price, String type, String descr, String image, Integer state) {
        this.prod_no = prod_no;
        this.ctgr_id = ctgr_id;
        this.ven_id = ven_id;
        this.stk_id = stk_id;
        this.prod_name = prod_name;
        this.price = price;
        this.type = type;
        this.descr = descr;
        this.image = image;
        this.state = state;
    }

    @Override
    public String toString() {
        return "Product{" +
                "prod_no='" + prod_no + '\'' +
                ", ctgr_id=" + ctgr_id +
                ", ven_id=" + ven_id +
                ", stk_id=" + stk_id +
                ", prod_name='" + prod_name + '\'' +
                ", price=" + price +
                ", type='" + type + '\'' +
                ", descr='" + descr + '\'' +
                ", image='" + image + '\'' +
                '}';
    }

    public String getProd_no() {
        return prod_no;
    }

    public void setProd_no(String prod_no) {
        this.prod_no = prod_no;
    }

    public Integer getCtgr_id() {
        return ctgr_id;
    }

    public void setCtgr_id(Integer ctgr_id) {
        this.ctgr_id = ctgr_id;
    }

    public Integer getVen_id() {
        return ven_id;
    }

    public void setVen_id(Integer ven_id) {
        this.ven_id = ven_id;
    }

    public Integer getStk_id() {
        return stk_id;
    }

    public void setStk_id(Integer stk_id) {
        this.stk_id = stk_id;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
}
