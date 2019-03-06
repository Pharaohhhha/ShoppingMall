package com.dio.guimei.dao.orderdao;

import com.dio.guimei.dao.JdbcUtil;
import com.dio.guimei.vo.Page;

import com.dio.guimei.vo.order.Product;
import com.dio.guimei.vo.order.TradeDetail;
import com.dio.guimei.vo.order.Trade_temp;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by wxk on 2018/8/31.
 */
public class OrderDao {

    QueryRunner runner = new QueryRunner(JdbcUtil.buildDataSource());

    public List<TradeDetail> findAll(){
        try{
            return runner.query( "SELECT  *  from  (SELECT td.*,rownum FROM trade_detail td)", new BeanListHandler<TradeDetail>(TradeDetail.class));

        } catch (SQLException e) {
            System.err.println("查询所有订单信息失败：" + e.getMessage());
        }
        return null;
    }

    public void save(TradeDetail tradeDetail){
        try{
            int i=runner.update(
                    "insert into trade_detail(trd_no,prod_no,saler,quantity,discount_price) " +
                            " values(?,?,?,?,?)",
                    tradeDetail.getTrd_no(),
                    tradeDetail.getProd_no(),
                    tradeDetail.getSaler(),
                    tradeDetail.getQuantity(),
                    tradeDetail.getDiscount_price()
            );

            if(i==1){
                System.out.println("添加成功");
            }else {
                System.out.println("添加失败");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


        public int delete(String trd_no) {
        try{
            int i= runner.update("delete trade_detail where trd_no=? ", trd_no);
            if(i==1){
                System.out.println("删除成功!");
            }else{
                System.out.println("删除失败！");
            }
            return i;
        } catch (SQLException e) {
            System.err.println("删除失败：" + e.getMessage());
        }
        return 0;
    }
    public boolean update(TradeDetail tradeDetail) {
        int effectRow=0;
        try{

            effectRow = runner.update("update TRADE_DETAIL set PROD_NO=?,SALER=?,QUANTITY=?,DISCOUNT_PRICE=? where TRD_NO=? ",
                    tradeDetail.getProd_no(),
                    tradeDetail.getSaler(),
                    tradeDetail.getQuantity(),
                    tradeDetail.getDiscount_price(),
                    tradeDetail.getTrd_no()

            );


        } catch (SQLException e) {
            System.err.println("更新失败：" + e.getMessage());
        }
        return (effectRow == 1 ? true : false);
    }


    public Trade_temp findOrder1(String trd_no){
        try{

               return runner.query( "SELECT LOGIN_NAME,TRD_TIME,TRD_LOC,RECEIVER,PHONE from GUIMEI_USERS g,TRADE_INFO t WHERE g.USER_ID=t.BUYER AND TRD_NO=?",
                     new BeanHandler<Trade_temp>(Trade_temp.class),
                     trd_no);

        } catch (SQLException e) {
            System.err.println("查询所有订单信息失败：" + e.getMessage());
        }
        return null;

    }

    public Product findOrder2(String trd_no){
        try{

            return runner.query( "SELECT IMAGE,PROD_NAME,PRICE,TYPE,DESCR,CTGR_ID,VEN_ID,STK_ID,PRODUCT.PROD_NO PROD_NO  FROM PRODUCT,TRADE_DETAIL WHERE PRODUCT.PROD_NO=TRADE_DETAIL.PROD_NO AND TRD_NO=? ",
                    new BeanHandler<Product>(Product.class),
                    trd_no);

        } catch (SQLException e) {
            System.err.println("查询所有订单信息失败：" + e.getMessage());
        }
        return null;

    }
    public List<TradeDetail> findAll(Page<TradeDetail> page,String select_time,String select_lgtime){
        try{
            //language=SQL
            StringBuffer innerSQL = new StringBuffer("SELECT td.TRD_NO trd_no,PROD_NO,SALER,QUANTITY,DISCOUNT_PRICE,TRD_TIME FROM TRADE_DETAIL td,TRADE_INFO tf WHERE td.TRD_NO=tf.TRD_NO ");
            List<Object> params = new ArrayList<>();
            if(StringUtils.isNotBlank(select_time)){
                innerSQL.append("AND TRD_TIME > to_timestamp(?,'yyyy-mm-dd hh24:mi:ss')");
                params.add(select_time);
            }
            if(StringUtils.isNotBlank(select_lgtime)){
                innerSQL.append("AND TRD_TIME < to_timestamp(?,'yyyy-mm-dd hh24:mi:ss')");
                params.add(select_lgtime);
            }
            System.out.println(innerSQL);
            params.add(page.getLastIndex());
            params.add(page.getFirstIndex());

            String sql = "SELECT * FROM (SELECT t.*, ROWNUM rn FROM ( " + innerSQL.toString() + " ) t WHERE ROWNUM <= ?) WHERE rn>=?";
            return runner.query(sql, new BeanListHandler<TradeDetail>(TradeDetail.class),params.toArray());

        } catch (SQLException e) {
            System.err.println("查询订单信息失败：" + e.getMessage());
        }
        return null;
    }


    public Integer countForPage(Page<TradeDetail> page,String select_time,String select_lgtime){
        try{
            StringBuffer innerSQL = new StringBuffer("SELECT count(*) cnt  FROM TRADE_DETAIL td,TRADE_INFO tf WHERE td.TRD_NO=tf.TRD_NO ");
            List<Object> params = new ArrayList<>();
            if(StringUtils.isNotBlank(select_time)){
                innerSQL.append("AND TRD_TIME > to_timestamp(?,'yyyy-mm-dd hh24:mi:ss')");
                params.add(select_time);
            }
            if(StringUtils.isNotBlank(select_lgtime)){
                innerSQL.append("AND TRD_TIME < to_timestamp(?,'yyyy-mm-dd hh24:mi:ss')");
                params.add(select_lgtime);
            }
            System.out.println(innerSQL);
            params.add(page.getLastIndex());
            params.add(page.getFirstIndex());

            String sql = "SELECT * FROM (SELECT t.*, ROWNUM rn FROM ( " + innerSQL.toString() + " ) t WHERE ROWNUM <= ?) WHERE rn>=?";

            BigDecimal total = runner.query(sql.toString(), new ScalarHandler<BigDecimal>("cnt"), params.toArray());
            return total.intValue();
        } catch (SQLException e) {
            System.err.println("查询订单总记录失败：" + e.getMessage());
        }
        return 0;
    }


    /*    public int delete_prod(String prod_no) {
        try{
            int i= runner.update("delete product where prod_no=? ", prod_no);
            if(i==1){
                System.out.println("删除成功!");
            }else{
                System.out.println("删除失败！");
            }
            return i;
        } catch (SQLException e) {
            System.err.println("删除失败：" + e.getMessage());
        }
        return 0;
    }*/
    public int delete_detail(String prod_no) {
        try{
            int i= runner.update("delete trade_detail where prod_no=? ", prod_no);
            if(i==1){
                System.out.println("删除成功!");
            }else{
                System.out.println("删除失败！");
            }
            return i;
        } catch (SQLException e) {
            System.err.println("删除失败：" + e.getMessage());
        }
        return 0;
    }


    public boolean orderupdate(Product product) {
        int effectRow=0;
        try{

            effectRow = runner.update("update PRODUCT set image=?,PROD_NAME=?,PRICE=?,TYPE=?,DESCR=? WHERE PROD_NO=? ",
                    product.getImage(),
                    product.getProd_name(),
                    product.getPrice(),
                    product.getType(),
                    product.getDescr(),
                    product.getProd_no()

            );


        } catch (SQLException e) {
            System.err.println("更新失败：" + e.getMessage());
        }
        return (effectRow == 1 ? true : false);
    }
    public boolean updatebuyer(Trade_temp trade_temp,String trd_no) {
        int effectRow=0;
        try{

            effectRow = runner.update("update TRADE_INFO set RECEIVER=?,PHONE=?,TRD_LOC=? where TRD_NO=? ",
                    trade_temp.getReceiver(),
                    trade_temp.getPhone(),
                    trade_temp.getTrd_loc(),
                    trd_no

            );


        } catch (SQLException e) {
            System.err.println("更新失败：" + e.getMessage());
        }
        return (effectRow == 1 ? true : false);
    }






}
