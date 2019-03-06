package com.dio.guimei.vo.vendor;

import java.io.Serializable;

/**
 * Created by HelloWorld on 2018/8/31.
 */
public class Vendor implements Serializable {
    private Integer rownum;
    private Integer ven_id;
    private String ven_name;
    private String ven_addr;
    private Integer state = 1;

    public Vendor() {
    }

    public Vendor(Integer rownum,Integer ven_id, String ven_name, String ven_addr) {
        this.rownum = rownum;
        this.ven_id = ven_id;
        this.ven_name = ven_name;
        this.ven_addr = ven_addr;
    }

    public Vendor(Integer rownum, Integer ven_id, String ven_name, String ven_addr, Integer state) {
        this.rownum = rownum;
        this.ven_id = ven_id;
        this.ven_name = ven_name;
        this.ven_addr = ven_addr;
        this.state = state;
    }

    public Integer getRownum() {
        return rownum;
    }

    public void setRownum(Integer rownum) {
        this.rownum = rownum;
    }

    public Integer getVen_id() {
        return ven_id;
    }

    public void setVen_id(Integer ven_id) {
        this.ven_id = ven_id;
    }

    public String getVen_name() {
        return ven_name;
    }

    public void setVen_name(String ven_name) {
        this.ven_name = ven_name;
    }

    public String getVen_addr() {
        return ven_addr;
    }

    public void setVen_addr(String ven_addr) {
        this.ven_addr = ven_addr;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Vendor{" +
                "rownum=" + rownum +
                ", ven_id=" + ven_id +
                ", ven_name='" + ven_name + '\'' +
                ", ven_addr='" + ven_addr + '\'' +
                '}' + "\n";
    }
}
