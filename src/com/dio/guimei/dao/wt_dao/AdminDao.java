package com.dio.guimei.dao.wt_dao;

import com.dio.guimei.dao.JdbcUtil;
import com.dio.guimei.vo.wt.Admin;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

import static com.dio.guimei.comm.MD5Encrypt.MD5Encode;

/**
 * @author 王涛
 * @Created by WT on 2018/8/31.
 */
public class AdminDao {
    QueryRunner runner = new QueryRunner(JdbcUtil.buildDataSource());
    public Admin login(Admin admin){
        try{
            return runner.query(
                    "SELECT * " +
                            " FROM guimei_admin WHERE login_name=? AND password=?",
                    new BeanHandler<Admin>(Admin.class),
                   admin.getLogin_Name(),
                    MD5Encode(admin.getPassword()));
        } catch (SQLException e) {
            System.err.println("登录失败：" + e.getMessage());
        }
        return null;
    }
    public Integer update(Admin admin){
        try{
            return runner.update(
                    "update guimei_admin set " +
                            "LOGIN_NAME=?," +
                            "PASSWORD=?," +
                            "ADDRESS=?," +
                            "EMAIL=?," +
                            "PHONE=?," +
                            "PROFILE=?" +
                            " where USER_ID=? ",
                    admin.getLogin_Name(),
                    MD5Encode(admin.getPassword()),
                    admin.getAddress(),
                    admin.getEmail(),
                    admin.getPhone(),
                    admin.getProfile(),
                    admin.getUser_Id());
        } catch (SQLException e) {
            System.err.println("登录失败：" + e.getMessage());
        }
        return null;
    }
}
