package com.dio.guimei.vo.category;

import java.io.Serializable;

/**
 * Created by xxxx on 2018/9/1.
 */
public class BigCtgr implements Serializable {
    private String bigCtgr;

    public BigCtgr(String bigCtgr) {
        this.bigCtgr = bigCtgr;
    }

    public String getBigCtgr() {
        return bigCtgr;
    }

    public BigCtgr() {
    }

    public void setBigCtgr(String bigCtgr) {
        this.bigCtgr = bigCtgr;
    }

    @Override
    public String toString() {
        return "BigCtgr{" +
                "bigCtgr='" + bigCtgr + '\'' +
                '}';
    }
}
