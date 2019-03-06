package com.dio.guimei.dao.UserManagerDao;

import com.dio.guimei.dao.JdbcUtil;
import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.UserManagerVo.Users;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

/**
 * Created by CBS on 2018/8/31.
 */
public class UserDao {
    QueryRunner runner =new QueryRunner(JdbcUtil.buildDataSource(),true);


    public Integer countForPage(){
        try{
            BigDecimal total = runner.query("SELECT count(*) cnt FROM GUIMEI_USERS where state = 1", new ScalarHandler<BigDecimal>("cnt"));
            return total.intValue();
        } catch (SQLException e) {
            System.err.println("查询用户信息失败：" + e.getMessage());
        }
        return 0;
    }

    public List<Users> findAll(Page page){
        //language=SQL
        String sql="SELECT * FROM \n" +
                "(SELECT t.*, ROWNUM rn FROM \n" +
                "( SELECT * FROM GUIMEI_USERS WHERE state = 1)t \n" +
                "WHERE ROWNUM <= ? ) \n" +
                "WHERE rn>=?";
        try {
            return runner.query(sql,new BeanListHandler<Users>(Users.class),page.getLastIndex(),page.getFirstIndex());
        } catch (SQLException e) {
            System.out.println("查询用户失败"+e.getMessage());
        }
        return null;
    }

    public Users queryByPK(Integer user_id){
        try {
            return this.runner.query(JdbcUtil.getConnection(),
                    "select * from guimei_users where state = 1 and user_id=?",
                    new BeanHandler<Users>(Users.class),
                    user_id);
        } catch (SQLException e) {
            System.err.println("编号查询失败：" + e.getMessage());
        }
        return null;
    }


    public Users getUserFromRequest(HttpServletRequest request){
        String login_name = request.getParameter("login_name");
        String password = request.getParameter("password");

        String first_name = request.getParameter("first_name");


        String last_name = request.getParameter("last_name");

        String _birthday=request.getParameter("birthday");
        Date birthday = null;
        if(StringUtils.isNotBlank(_birthday)){
            try {
                birthday = new java.sql.Date(DateUtils.parseDate(_birthday,"yyyy-MM-dd").getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String header = request.getParameter("header");
        String hobbit = request.getParameter("hobbit");


        return new Users(null, login_name, password, first_name, last_name, email, gender, header,hobbit,birthday);
    }


    public Integer save(Users users){

        try {
            users.setHeader("userManager/user_images/header/1.jpg");
            return runner.update("INSERT into GUIMEI_USERS(USER_ID, LOGIN_NAME, PASSWORD, FIRST_NAME, LAST_NAME, EMAIL, GENDER,Header, HOBBIT, BIRTHDAY,state) " +
                            "VALUES(user_seq.nextval,?,?,?,?,?,?,?,?,1) ",
                    users.getLogin_name(),
                    users.getPassword(),
                    users.getFirst_name(),
                    users.getLast_name(),
                    users.getEmail(),
                    users.getGender(),
                    users.getHeader(),
                    users.getHobbit(),
                    new java.sql.Date(users.getBirthday().getTime()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;

    }
    public Integer delete(Users user){
        try {
           return runner.update(" update  guimei_users  set  state = 0  where  User_id = ?",user.getUser_id());
        } catch (SQLException e) {
            System.err.println(("删除失败")+e.getMessage());
        }
        return 0;
    }

    public int update(Users users){
        try {
            return runner.update("UPDATE GUIMEI_USERS SET PASSWORD=?,EMAIL=?, HEADER=?, HOBBIT=? WHERE USER_ID=?",

                    users.getPassword(),
                    users.getEmail(),
                    users.getHeader(),
                    users.getHobbit(),
                    users.getUser_id());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

}
