package com.dio.guimei.dao.category;

import com.dio.guimei.dao.JdbcUtil;
import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.category.BigCtgr;
import com.dio.guimei.vo.category.Category;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xxxx on 2018/8/31.
 */
public class CategoryDao {


    QueryRunner runner = new QueryRunner(JdbcUtil.buildDataSource(),true);


    public List<Category> queryAll(){
        List<Category> categoryList = new ArrayList<Category>();
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM (SELECT t.*,rownum where state = 1 from CATEGORY t)")
        ){
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                categoryList.add(new Category(rs.getInt("ctgr_id"),
                        rs.getString("ctgr_name"),
                        rs.getString("big_ctgr"),
                        rs.getInt("rowNum")));
            }

        }catch (SQLException e){
            System.err.println("查询所有商品分类实体失败：" + e.getMessage());
        }
        return categoryList;
    }


    public List<Category> findAll(String big_ctgr,Page<Category> page){
        try{
            //language=SQL
            StringBuffer innerSQL = new StringBuffer("SELECT * FROM CATEGORY WHERE state = 1 and 1=1");

            List<Object> params = new ArrayList<>();
            if(big_ctgr!=null){
                innerSQL.append(" and big_ctgr = ? ");
                params.add(big_ctgr);
            }
            params.add(page.getLastIndex());
            params.add(page.getFirstIndex());

            String sql = "SELECT * FROM (SELECT t.*, ROWNUM rn FROM ( " + innerSQL.toString() + " ) t WHERE ROWNUM <= ?) WHERE rn>=?";
            return runner.query(sql, new BeanListHandler<Category>(Category.class), params.toArray());

        } catch (SQLException e) {
            System.err.println("查询所有商品分类信息失败：" + e.getMessage());
        }
        return null;
    }




    public Category queryById(Integer id){
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM (SELECT t.*,rownum where state = 1 from CATEGORY t WHERE  CTGR_ID = ?)")
        ){
            ps.setObject(1,id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                return new Category(rs.getInt("ctgr_id"),
                        rs.getString("ctgr_name"),
                        rs.getString("big_ctgr"),
                        rs.getInt("rowNum"));
            }

        }catch (SQLException e){
            System.err.println("查询商品分类实体失败：" + e.getMessage());
        }
        return null;
    }



    public List<BigCtgr> queryBig(){
        List<BigCtgr> bigCtgrsList = new ArrayList<BigCtgr>();
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT distinct big_ctgr FROM CATEGORY")
        ){
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                bigCtgrsList.add(new BigCtgr(rs.getString("big_ctgr")));
            }

        }catch (SQLException e){
            System.err.println("查询所有商品大分类失败：" + e.getMessage());
        }
        return bigCtgrsList;
    }

    public Integer countForPage(String big_ctgr,Page<Category> page){
        try{
            StringBuffer sql = new StringBuffer("SELECT  count(*) cnt FROM CATEGORY WHERE state = 1 and 1=1 ");
            List<Object> params = new ArrayList<>();


            sql.append(" and big_ctgr like ? ");
            params.add("%" + big_ctgr + "%");

            BigDecimal total = runner.query(sql.toString(), new ScalarHandler<BigDecimal>("cnt"), params.toArray());
            return total.intValue();
        } catch (SQLException e) {
            System.err.println("查询所有信息失败：" + e.getMessage());
        }
        return 0;
    }




    public int save(Category category){
        try(Connection conn = JdbcUtil.getConnection()) {
            int i= runner.update(conn,
                    "insert into category " +
                            " values(cate_seq.nextval,?,?,1)",
                    category.getCtgr_name(),
                    category.getBig_ctgr()
            );
            return i;
        } catch (SQLException e) {
            System.err.println("插入商品分类实体失败" + e.getMessage());
        }
        return 0;
    }

    public int delete(Integer id){
        try(Connection conn=JdbcUtil.getConnection()){
            int i = runner.update(conn, "update category set state = 0 where ctgr_id = ?",id);
            return i;
        }catch (SQLException e){
            System.err.println("删除失败"+e.getMessage());
        }
        return 0;
    }

    public int update(Category category) {
        try (Connection conn = JdbcUtil.getConnection()) {
            int i = runner.update(conn, "update category set ctgr_name = ? ,big_ctgr = ? where ctgr_id = ?",
                    category.getCtgr_name(), category.getBig_ctgr(), category.getCtgr_id());
            return i;
        } catch (SQLException e) {
            System.err.println("更新失败"+e.getMessage());
        }
        return 0;
    }

    public static void main(String[] args) {
        CategoryDao categoryDao = new CategoryDao();

//        categoryDao.save(new Category(null,"电动棒","家用电器"));
//        categoryDao.update(new Category(1016,"电冰箱","家用电器"));
//        Category category = new Category(null,"",null);
//        Page<Category> page = new Page(category);
//        List<Category> categoryList = categoryDao.findAll(null,page);
//        for (Category categor : categoryList) {
//            System.out.println(categor);
//        }
//        categoryDao.delete(1015);
//        System.out.println(categoryDao.countForPage("箱",page));


    }

}
