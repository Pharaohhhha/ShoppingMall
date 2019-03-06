package com.dio.guimei.vo.category;

import java.io.Serializable;

/**
 * Created by xxxx on 2018/8/31.
 */
public class Category implements Serializable {
    private Integer ctgr_id;
    private String ctgr_name;
    private String big_ctgr;
    private Integer rowNum;
    private Integer state = 1;


    public Integer getRowNum() {
        return rowNum;
    }

    public void setRowNum(Integer rowNum) {
        this.rowNum = rowNum;
    }

    public Category() {
    }

    public Category(Integer ctgr_id, String ctgr_name, String big_ctgr, Integer rowNum, Integer state) {
        this.ctgr_id = ctgr_id;
        this.ctgr_name = ctgr_name;
        this.big_ctgr = big_ctgr;
        this.rowNum = rowNum;
        this.state = state;
    }

    public Category(Integer ctgr_id, String ctgr_name, String big_ctgr) {
        this.ctgr_id = ctgr_id;
        this.ctgr_name = ctgr_name;
        this.big_ctgr = big_ctgr;
    }

    public Category(Integer ctgr_id, String ctgr_name, String big_ctgr, Integer rowNum) {
        this.ctgr_id = ctgr_id;
        this.ctgr_name = ctgr_name;
        this.big_ctgr = big_ctgr;
        this.rowNum = rowNum;
    }

    public Integer getCtgr_id() {
        return ctgr_id;
    }

    public void setCtgr_id(Integer ctgr_id) {
        this.ctgr_id = ctgr_id;
    }

    public String getCtgr_name() {
        return ctgr_name;
    }

    public void setCtgr_name(String ctgr_name) {
        this.ctgr_name = ctgr_name;
    }

    public String getBig_ctgr() {
        return big_ctgr;
    }

    public void setBig_ctgr(String big_ctgr) {
        this.big_ctgr = big_ctgr;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Category{" +
                "ctgr_id=" + ctgr_id +
                ", ctgr_name='" + ctgr_name + '\'' +
                ", big_ctgr='" + big_ctgr + '\'' +
                ", rowNum=" + rowNum +
                '}';
    }
}
