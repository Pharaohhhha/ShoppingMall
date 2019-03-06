package com.dio.guimei.dao.saledao;

import com.dio.guimei.dao.JdbcUtil;
import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.tc.Salaprod;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by TCCCC on 2018/8/31/031.
 */
public class SalaprodDao {
    QueryRunner runner = new QueryRunner(JdbcUtil.buildDataSource(),true);

    public List<Salaprod> findAll(){
        try{
            return runner.query("select s.* ,p.PROD_NAME,p.IMAGE from sale_prod s,product p where p.PROD_NO=s.PROD_NO", new BeanListHandler<Salaprod>(Salaprod.class));
        } catch (SQLException e) {
            System.err.println("查询所有商品信息失败：" + e.getMessage());
        }
        return null;
    }


    public Salaprod findById(Salaprod salaprod){
        try{
            return runner.query( "SELECT  * FROM SALE_PROD WHERE id = ?",salaprod.getId(), new BeanHandler<Salaprod>(Salaprod.class));

        } catch (SQLException e) {
            System.err.println("查询所有商品信息失败：" + e.getMessage());
        }
        return null;
    }
    public Integer countForPage(Page<Salaprod> page){
        try{
            StringBuffer sql = new StringBuffer("SELECT  count(*) cnt FROM (select s.* ,p.PROD_NAME,p.IMAGE from sale_prod s,product p where p.PROD_NO=s.PROD_NO) WHERE 1=1 ");
            List<Object> params = new ArrayList<>();
            if(StringUtils.isNotBlank(page.getQueryObject().getProd_name())){
                sql.append(" and prod_name like ? ");
                params.add("%" + page.getQueryObject().getProd_name() + "%");
            }
            if(page.getQueryObject().getLowId() != null && page.getQueryObject().getLowId()>0){
                sql.append(" and id >= ?");
                params.add(page.getQueryObject().getLowId());
            }
            if(page.getQueryObject().getHiId() != null && page.getQueryObject().getHiId()>0.0){
                sql.append(" and id <= ?");
                params.add(page.getQueryObject().getHiId());
            }
            sql.append("  ORDER BY id ");
            BigDecimal total = runner.query(sql.toString(), new ScalarHandler<BigDecimal>("cnt"), params.toArray());
            return total.intValue();
        } catch (SQLException e) {
            System.err.println("查询所有商品信息失败：" + e.getMessage());
        }
        return 0;
    }


    /**
     * 查询所有库存
     * @return
     */
    public List<Salaprod> findAll(Page<Salaprod> page){
        try{
            //language=SQL
            StringBuffer innerSQL = new StringBuffer("SELECT * FROM (select s.* ,p.PROD_NAME,p.IMAGE from sale_prod s,product p where p.PROD_NO=s.PROD_NO) WHERE 1=1 ");

            List<Object> params = new ArrayList<>();
            if(StringUtils.isNotBlank(page.getQueryObject().getProd_name())){
                innerSQL.append(" and prod_name like ? ");
                params.add("%" + page.getQueryObject().getProd_name() + "%");
            }
            if(page.getQueryObject().getLowId() != null && page.getQueryObject().getLowId()>0.0){
                innerSQL.append(" and id >= ?");
                params.add(page.getQueryObject().getLowId());
            }
            if(page.getQueryObject().getHiId() != null && page.getQueryObject().getHiId()>0.0){
                innerSQL.append(" and id <= ?");
                params.add(page.getQueryObject().getHiId());
            }

            params.add(page.getLastIndex());
            params.add(page.getFirstIndex());

            String sql = "SELECT * FROM (SELECT t.*, ROWNUM rn FROM ( " + innerSQL.toString() + "  ORDER BY id) t WHERE ROWNUM <= ?) WHERE rn>=?  ";
            return runner.query(sql, new BeanListHandler<Salaprod>(Salaprod.class), params.toArray());
        } catch (SQLException e) {
            System.err.println("查询所有商品信息失败：" + e.getMessage());
        }
        return null;
    }

    public Integer delete(Salaprod salaprod){
        try{
            return  runner.update( "Delete FROM SALE_PROD WHERE id = ?",salaprod.getId());

        } catch (SQLException e) {
            System.err.println("删除商品信息失败：" + e.getMessage());
        }
        return null;
    }


    public Integer add(Salaprod salaprod){
        try{
            return runner.update( "INSERT INTO  SALE_PROD (ID,PROD_NO,SALER_ID,STK_ID,REAL_PRICE,CARRIAGE,STAR_TIME,END_TIME,PROD_SKIN,LOCATION) values(SALE_PROD_SEQ.nextval,?,?,?,?,?,?,?,?,?) ",
                    salaprod.getProd_no(),
                    salaprod.getSaler_id(),
                    salaprod.getStk_id(),
                    salaprod.getReal_price(),
                    salaprod.getCarriage(),
                    salaprod.getStar_time(),
                    salaprod.getEnd_time(),
                    salaprod.getProd_skin(),
                    salaprod.getLocation()
            );
        } catch (SQLException e) {
            System.err.println("增加商品信息失败：" + e.getMessage());
        }
        return  null;
    }


    public Integer update(Salaprod salaprod){
        try{
            return   runner.update( "UPDATE  SALE_PROD SET PROD_NO=?,SALER_ID=?,STK_ID=?,REAL_PRICE=?,CARRIAGE=?,STAR_TIME=?,END_TIME=?,PROD_SKIN=?,LOCATION=? WHERE id = ?",
                    salaprod.getProd_no(),
                    salaprod.getSaler_id(),
                    salaprod.getStk_id(),
                    salaprod.getReal_price(),
                    salaprod.getCarriage(),
                    salaprod.getStar_time(),
                    salaprod.getEnd_time(),
                    salaprod.getProd_skin(),
                    salaprod.getLocation(),
                    salaprod.getId());
        } catch (SQLException e) {
            System.err.println("更新商品信息失败：" + e.getMessage());
        }
        return null;
    }

    public static void main(String[] args) {
        SalaprodDao salaprodDao = new SalaprodDao();
        List<Salaprod> all = salaprodDao.findAll();
        System.out.println(all);
    }
}

