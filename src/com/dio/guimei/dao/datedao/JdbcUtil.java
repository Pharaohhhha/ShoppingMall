package com.dio.guimei.dao.datedao;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

/**
 * @author 张建平 on 2018/8/6 15:27
 */
public class JdbcUtil {
    //数据库的连接属性
//    public static final String URL = getProperty("jdbc.url");
//    public static final String USER = getProperty("jdbc.user");
//    public static final String PASSWORD = getProperty("jdbc.password");

    static  DataSource dataSource;

    //加载数据库驱动
    static {
        dataSource = buildDataSource();
        /*
        try {
            //对于整个应用程序来说只需加载过一次即可，因此我们通常会在一个static{ }中执行
            Class.forName(getProperty("jdbc.driver"));
        } catch (ClassNotFoundException e) {
            System.err.println("加载数据库驱动失败！" + e.getMessage());
        }*/
    }

    /**
     * 获得数据库的连接
     * @return
     */
    public static Connection getConnection(){
        try {
            //不可取方案，
            //较好的替代方案javax.sql.DataSource来获得数据库连接Connection
//            return DriverManager.getConnection(URL, USER, PASSWORD);
            return  dataSource.getConnection();

        } catch (SQLException e) {
            System.err.println("连接数据失败！" + e.getMessage());
        }
        return null;
    }

    /**
     * 创建数据源
     * @return
     */
    public static  DataSource buildDataSource(){
        // 手动方式创建数据源：好处可在junit环境进行测试使用
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(getProperty("jdbc.driver"));
        dataSource.setUrl(getProperty("jdbc.url"));
        dataSource.setUsername(getProperty("jdbc.user"));
        dataSource.setPassword(getProperty("jdbc.password"));

        //以下的几个特性可不不设置，有默认值
        //设置最大可用连接数
        dataSource.setMaxTotal(10);
        //设置最大的空闲连接数
        dataSource.setMaxIdle(2);
        //当连接池无连接可用时，最大的等待时间
        dataSource.setMaxWaitMillis(10000);

        return dataSource;
    }

    /*public static  DataSource buildDataSource(){
        //服务器内配置数据源：缺点：不可在junit环境进行测试使用
        try {
            //初始化JNDI上下文
            Context context = new InitialContext();
            // comp: company, env: enviroment
            // java:/comp/env/  为JNDI查找的固定前缀
            dataSource = (DataSource) context.lookup("java:/comp/env/jdbc/scgs");
        } catch (NamingException e) {
            e.printStackTrace();
        }
        return dataSource;
    }*/

    /**
     *  释放数据资源
     *
     * @param conn
     * @param stmt
     * @param rs
     */
    public static void close(Connection conn, Statement stmt, ResultSet rs){
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    /**
     * 读取指定key的value
     *
     * @param key - 属性文件中的key
     * @return
     */
    private static String getProperty(String key){
        // 绑定jdbc.properties
        ResourceBundle bundle = ResourceBundle.getBundle("jdbc");
        return bundle.getString(key);
    }

    // RMI: Remote Method Invoke, 局域内
    // alibaba Dubbo: RMI框架， 多系统交互
    public static void main(String[] args) {
        System.out.println(JdbcUtil.getProperty("jdbc.url"));
    }

}
