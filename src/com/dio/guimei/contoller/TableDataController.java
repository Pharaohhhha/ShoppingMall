package com.dio.guimei.contoller;

import javax.servlet.http.*;
import java.util.List;


import com.dio.guimei.dao.datedao.MonthDao;
import com.dio.guimei.vo.datevo.Months;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by a'su's on 2018/9/2.
 */
@Controller
    public class TableDataController{
    @RequestMapping("/Table")
    public String  queryAll(Months months , HttpSession session){
        MonthDao monthDao = new MonthDao();
      List<Months> monthList=null;
      monthList = monthDao.queryByYear(months);
      session.setAttribute("SaleMonthList",monthList);
        return "Table/Table.jsp";


    }
}