package com.dio.guimei.dao.datedao;

import com.dio.guimei.dao.*;

import com.dio.guimei.vo.datevo.Months;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by a'su's on 2018/9/4.
 */
public class MonthDao {
    QueryRunner runner = new QueryRunner(com.dio.guimei.dao.JdbcUtil.buildDataSource(),true);

    public List<Months> queryByYear(Months months){
        String str = null;
        try {
            StringBuffer sql=new StringBuffer("SELECT to_char(I.TRD_TIME,'mm') month,sum(TOTAL_MONEY) monthSum ,to_char(I.TRD_TIME,'yyyy') years " +
                    "FROM TRADE_INFO I WHERE 1=1 ");
            if (months.getYears() != null) {
//                sql.append("and to_char(I.TRD_TIME,'yyyy')=?");
//                params.add(months.getYears());
                if (months.getMonth()!=null) {
                    //判断 上半年 下半年
                    if (months.getMonth()== 1) {
                        //1为下半年
                        sql.append("and to_char(I.TRD_TIME,'yyyy-MM-dd')>=?");
                        str = months.getYears().toString()+"-06-30";
                    }else if(months.getMonth()== 2) {
                        //否则为上半年
                        sql.append(" and to_char(I.TRD_TIME,'yyyy-MM-dd')<?");
                        str = months.getYears().toString()+"-06-01";
                    }else if(months.getMonth()== 0){
                        //不选上下半年默认全年
                        sql.append("and to_char(I.TRD_TIME,'yyyy')=?");
                        str = months.getYears().toString();
                    }
                }
                sql.append(" GROUP BY to_char(I.TRD_TIME,'mm'),to_char(I.TRD_TIME,'yyyy') ORDER BY to_char(I.TRD_TIME,'mm')");
                /*" WHERE to_char(I.TRD_TIME,'yyyy')=2018 " +
                        "GROUP BY to_char(I.TRD_TIME,'mm'),to_char(I.TRD_TIME,'yyyy') ORDER BY to_char(I.TRD_TIME,'mm')"*/
            }
            System.out.println(sql.toString());
          return runner.query(sql.toString(),new BeanListHandler<Months>(Months.class),str);

        } catch (SQLException e) {
            e.printStackTrace();
        }
return  null;
    }

    //测试
    public static void main(String[] args) {
        MonthDao monthDao = new MonthDao();
        System.out.println(monthDao.queryByYear(new Months()));
    }
}
