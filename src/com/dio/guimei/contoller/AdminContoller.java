package com.dio.guimei.contoller;

import com.dio.guimei.dao.wt_dao.AdminDao;
import com.dio.guimei.vo.wt.Admin;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author 王涛
 * @Created by WT on 2018/8/31.
 */
@Controller
public class AdminContoller {
    @RequestMapping("/user/login")
    public String login(Admin admin, HttpServletRequest request, HttpSession session ){
        Admin logUser = new AdminDao().login(admin);
        System.out.println(logUser);
        if (logUser != null) {
            //保存数据 到 httpsession
            session.setAttribute("logUser", logUser);
            //return "/dosomething.jsp";
            return "/user/list.do?modelId=1";
        }else{
            return "redirect:/login.jsp";
        }
    }
    @RequestMapping("/user/exit")
    public String exit(HttpServletRequest request, HttpSession session ){
        session.removeAttribute("logUser");
        return "redirect:/login.jsp";
    }
}
