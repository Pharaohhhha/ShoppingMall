package com.dio.guimei.dao.finishedGoodDao;

import com.dio.guimei.dao.JdbcUtil;
import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.finishedFoodVo.FinishedGood;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang3.StringUtils;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 123 on 2018/8/31.
 */
public class FinishedGoodDao {
    QueryRunner runner = new QueryRunner(JdbcUtil.buildDataSource(),true);

    public List<FinishedGood> findAll(){
        try{
            return runner.query( "SELECT  * FROM STOCK ORDER BY stk_id where state = 1;", new BeanListHandler<FinishedGood>(FinishedGood.class));

        } catch (SQLException e) {
            System.err.println("查询所有库信息失败：" + e.getMessage());
        }

        return null;
    }

    public FinishedGood findById(FinishedGood finishedGood){
        try{
            return runner.query( "SELECT  * FROM STOCK WHERE stk_id = ? and state = 1",finishedGood.getStk_id(), new BeanHandler<FinishedGood>(FinishedGood.class));

        } catch (SQLException e) {
            System.err.println("查询所有库信息失败：" + e.getMessage());
        }
        return null;
    }

    public Integer countForPage(Page<FinishedGood> page){
        try{
            StringBuffer sql = new StringBuffer("SELECT  count(*) cnt FROM STOCK WHERE  state = 1 and 1=1  ");
            List<Object> params = new ArrayList<>();

            if(StringUtils.isNotBlank(page.getQueryObject().getStk_name())){
                sql.append(" and stk_name like ? ");
                params.add("%" + page.getQueryObject().getStk_name() + "%");
            }
            if(page.getQueryObject().getLowId() != null && page.getQueryObject().getLowId()>0){
                sql.append(" and stk_id >= ?");
                params.add(page.getQueryObject().getLowId());
            }
            if(page.getQueryObject().getHiId() != null && page.getQueryObject().getHiId()>0.0){
                sql.append(" and stk_id <= ?");
                params.add(page.getQueryObject().getHiId());
            }
                sql.append("  ORDER BY stk_id ");
            BigDecimal total = runner.query(sql.toString(), new ScalarHandler<BigDecimal>("cnt"), params.toArray());
            return total.intValue();
        } catch (SQLException e) {
            System.err.println("查询所有库存信息失败：" + e.getMessage());
        }
        return 0;
    }

    /**
     * 查询所有库存
     * @return
     */
    public List<FinishedGood> findAll(Page<FinishedGood> page){
        try{
            //language=SQL
            StringBuffer innerSQL = new StringBuffer("SELECT * FROM STOCK WHERE state = 1 and 1=1 ");

            List<Object> params = new ArrayList<>();
            if(StringUtils.isNotBlank(page.getQueryObject().getStk_name())){
                innerSQL.append(" and stk_name like ? ");
                params.add("%" + page.getQueryObject().getStk_name() + "%");
            }
            if(page.getQueryObject().getLowId() != null && page.getQueryObject().getLowId()>0.0){
                innerSQL.append(" and stk_id >= ?");
                params.add(page.getQueryObject().getLowId());
            }
            if(page.getQueryObject().getHiId() != null && page.getQueryObject().getHiId()>0.0){
                innerSQL.append(" and stk_id <= ?");
                params.add(page.getQueryObject().getHiId());
            }

            params.add(page.getLastIndex());
            params.add(page.getFirstIndex());

            String sql = "SELECT * FROM (SELECT t.*, ROWNUM rn FROM ( " + innerSQL.toString() + "  ORDER BY stk_id) t WHERE ROWNUM <= ?) WHERE rn>=?  ";
            return runner.query(sql, new BeanListHandler<FinishedGood>(FinishedGood.class), params.toArray());
        } catch (SQLException e) {
            System.err.println("查询所有库存信息失败：" + e.getMessage());
        }
        return null;
    }

    public Integer delete(FinishedGood finishedGood){
        try{
            return  runner.update( "update STOCK set state = 0 where Stk_id = ? ",finishedGood.getStk_id());

        } catch (SQLException e) {
            System.err.println("删除库信息失败：" + e.getMessage());
        }
        return null;
    }

    public Integer add(FinishedGood finishedGood){
        try{
           return runner.update( "INSERT INTO  STOCK (stk_id,stk_name,quantity,in_stk_date,out_stk_date,state) values(stock_seq.nextval,?,?,?,?,1) ",
                    finishedGood.getStk_name(),finishedGood.getQuantity(),new java.sql.Date(finishedGood.getIn_stk_date().getTime()),new java.sql.Date(finishedGood.getOut_stk_date().getTime()));
        } catch (SQLException e) {
            System.err.println("增加库信息失败：" + e.getMessage());
        }
        return  null;
    }

    public Integer update(FinishedGood finishedGood){
        try{
            System.out.println(finishedGood.getIn_stk_date());
            return   runner.update( "UPDATE  STOCK SET stk_name = ? ,quantity = ? ,in_stk_date = ?,out_stk_date = ? WHERE stk_id = ?",
                    finishedGood.getStk_name(),finishedGood.getQuantity(),finishedGood.getIn_stk_date(),finishedGood.getOut_stk_date(),finishedGood.getStk_id());
        } catch (SQLException e) {
            System.err.println("更新库信息失败：" + e.getMessage());
        }
        return null;
    }
//new java.sql.Date(finishedGood.getIn_stk_date().getTime())
    public static void main(String[] args) {
        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();
        List<FinishedGood> all = finishedGoodDao.findAll();
        for (FinishedGood finishedFood : all) {
            System.out.println(finishedFood);
        }
    }

}
