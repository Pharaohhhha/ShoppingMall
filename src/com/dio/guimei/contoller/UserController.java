package com.dio.guimei.contoller;


import com.dio.guimei.dao.UserManagerDao.UserDao;
import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.UserManagerVo.Users;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.lang3.time.DateUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

/**
 * Created by CBS on 2018/9/1.
 */
@Controller
public class UserController {
//    @RequestMapping("/userManager/user/login")
//    public String login() {
//        System.out.println("login....");
//        return "/userManager/user/list.do";
//
//    }

    @RequestMapping("/user/list")
    public String list(HttpServletRequest request, HttpSession session) {
        // List<Users> usersList =new UserDao()
        UserDao userDao = new UserDao();

        List<Users> usersList = null;
        Page page = (Page) session.getAttribute("userPage");


        if (session.getAttribute("userPage") == null) {
            //第一次请求
            //获得总记录数
            int tatalRow = userDao.countForPage();
            page = new Page(tatalRow);
            page.setPageNo(1);
            page.setPageSize(6);
            usersList = userDao.findAll(page);

        } else {
            // 第2次后的请求，也就是说此时用户是点击了： 【第一页】【上一页】【下一页】【最后一页】
            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));
            usersList = userDao.findAll(page);
        }
        System.out.println(page);
        session.setAttribute("userPage", page);
        request.setAttribute("usersList", usersList);
        return "/userManager/main.jsp";
    }

    @RequestMapping("/user/add")
    public String add(HttpServletRequest request, HttpSession session) throws ParseException {
        Users user = new Users();
        user.setLogin_name(request.getParameter("login_name"));
        user.setPassword(request.getParameter("password"));
        user.setFirst_name(request.getParameter("first_name"));
        user.setLast_name(request.getParameter("last_name"));

        user.setBirthday(DateUtils.parseDate(request.getParameter("birthday"),"yyyy-MM-dd"));

        user.setEmail(request.getParameter("email"));
        user.setGender(request.getParameter("gender"));
        user.setHeader(request.getParameter("header"));
        user.setHobbit(request.getParameter("hobbit"));
        Integer i = new UserDao().save(user);
        if (i==1) {
            request.setAttribute("addMsg",true);
            return list(request,session);
        }else {
            request.setAttribute("addMsg",false);
            return list(request,session);
        }
    }

    @RequestMapping("/user/delete")
    public String delete(Users users,HttpServletRequest request, HttpSession session) {
        UserDao userDao = new UserDao();
        int i = userDao.delete(users);
        if (i == 1) {
            return list(request, session);
        }
        return null;
    }

    @RequestMapping("/user/update")
    public String update(Users users,HttpServletRequest request,HttpSession session){
        users.setHeader("userManager/user_images/header/"+users.getHeader());
       int i =new UserDao().update(users);
       if (i==1){
           return list(request,session);
       }
       return null;
    }


}
