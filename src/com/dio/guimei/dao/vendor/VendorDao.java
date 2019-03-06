package com.dio.guimei.dao.vendor;

import com.dio.guimei.dao.JdbcUtil;

import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.vendor.Vendor;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HelloWorld on 2018/8/31.
 */
public class VendorDao {
    QueryRunner runner = new QueryRunner(JdbcUtil.buildDataSource(),true);
    
//    public Integer countForVender() throws SQLException {
//        String sql = "select count(*) count from vendor where  state = 1 ";
//        BigDecimal total = runner.query(sql, new ScalarHandler<>("count"));
//        return  total.intValue();
//    }

    public Integer countForVender(Page<Vendor> page) throws SQLException {
        StringBuffer sql = new StringBuffer("SELECT  count(*) count FROM vendor  WHERE state = 1 and 1=1 ");
        List<Object> params = new ArrayList<>();

        if(StringUtils.isNotBlank(page.getQueryObject().getVen_name())){
            sql.append(" and ven_name like ? ");
            params.add("%" + page.getQueryObject().getVen_name()+ "%");
        }
        if(StringUtils.isNotBlank(page.getQueryObject().getVen_addr())){
            sql.append(" and ven_addr like ? ");
            params.add("%" + page.getQueryObject().getVen_addr()+ "%");
        }
        BigDecimal total = runner.query(sql.toString(), new ScalarHandler<>("count"),params.toArray());
        return  total.intValue();

    }
    
//    public List<Vendor> findAll(Page<Vendor> page) throws SQLException {
//        List<Object> params = new ArrayList<>();
//
//        params.add(page.getLastIndex());
//        params.add(page.getFirstIndex());
//
//        //language=SQL
//        String sql = "select rownum,t.* from ( select rownum rn,v.* from vendor v where  state = 1 and rownum < = ? ) t where rn >= ?";
//        return runner.query(sql, new BeanListHandler<Vendor>(Vendor.class),params.toArray());
//    }

    public List<Vendor> findByMsg(Page<Vendor>page) throws SQLException {
        StringBuffer innerSQL = new StringBuffer("SELECT * FROM vendor WHERE state = 1 and 1=1 ");
        List<Object> params = new ArrayList<>();

        if(StringUtils.isNotBlank(page.getQueryObject().getVen_name())){
            innerSQL.append(" and ven_name like ? ");
            params.add("%" + page.getQueryObject().getVen_name()+ "%");
        }

        if(StringUtils.isNotBlank(page.getQueryObject().getVen_addr())){
            innerSQL.append(" and ven_addr like ? ");
            params.add("%" + page.getQueryObject().getVen_addr()+ "%");
        }
        params.add(page.getLastIndex());
        params.add(page.getFirstIndex());
        //language=SQL
        String sql = "SELECT ROWNUM,v.* FROM (SELECT t.*, ROWNUM rn FROM ( " + innerSQL.toString() + " ) t WHERE ROWNUM <= ?) v WHERE rn>=?";
//        String sql = "SELECT * FROM (SELECT t.*, ROWNUM rn FROM ( " + innerSQL.toString() + " ) t WHERE ROWNUM <= ?) WHERE rn>=?";
        return runner.query(sql, new BeanListHandler<Vendor>(Vendor.class),params.toArray());
    }
    
    public int update(Vendor v) throws SQLException {
        String sql = "update vendor set ven_name=?,ven_addr=? where ven_id=?";
        return runner.update(sql, v.getVen_name(), v.getVen_addr(), v.getVen_id());
    }
    public int delete(Vendor v) throws SQLException {
        String sql = "update vendor set state = 0 where ven_id = ?";
        return runner.update(sql, v.getVen_id());
    }
    
    public int add(Vendor v) throws SQLException {
        String sql = "insert into vendor values(vendor_seq.nextval,?,?,1)";
        return runner.update(sql, v.getVen_name(), v.getVen_addr());

    }
}
