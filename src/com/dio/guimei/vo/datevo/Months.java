package com.dio.guimei.vo.datevo;

import java.io.Serializable;

/**
 * Created by a'su's on 2018/9/4.
 */
public class Months implements Serializable {
    private Integer years;
    private Integer month;
    private double monthSum;

    public Months() {
    }

    public Months(Integer years, Integer month, double monthSum) {
        this.years = years;
        this.month = month;
        this.monthSum = monthSum;
    }

    public Integer getYears() {
        return years;
    }

    public void setYears(Integer years) {
        this.years = years;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public double getMonthSum() {
        return monthSum;
    }

    public void setMonthSum(double monthSum) {
        this.monthSum = monthSum;
    }

    @Override
    public String toString() {
        return "Months{" +
                "years=" + years +
                ", month=" + month +
                ", monthSum=" + monthSum +
                '}';
    }
}
