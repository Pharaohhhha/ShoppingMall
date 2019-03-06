package com.dio.guimei.contoller;

import com.dio.guimei.dao.datedao.MonthDao;
import com.dio.guimei.vo.datevo.Months;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * Created by 123 on 2018/9/6.
 */
@WebServlet(value= "*.table")
public class QueryTableServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String season =request.getParameter("season") ;
        Integer year = Integer.valueOf(request.getParameter("year"));

        request.setAttribute("year2",request.getParameter("year"));

        session.setAttribute("season",season);

        Months months = new Months();
        if ("上半年".equals(season)) {
            months.setMonth(2);
        }
        else {
            if ("下半年".equals(season)) {
                months.setMonth(1);
            }else {
                if(Integer.valueOf(season)==0){
                    months.setMonth(0);
                }
            }
        }

        months.setYears(year);
        List<Months> months1 = new MonthDao().queryByYear(months);
        for (Months months2 : months1) {
            System.out.println(months2);
        }
        session.setAttribute("SaleMonthList",months1);


        String pic =request.getParameter("pic");
        if (pic.equals("bar")) {
            request.setAttribute("shape2","bar");
            RequestDispatcher rd = request.getRequestDispatcher("Table/index.jsp?shape=bar");//转发时，路径不要带项目名
            rd.forward(request, response);
        }
        else {
            request.setAttribute("shape2","line");
            RequestDispatcher rd = request.getRequestDispatcher("Table/index.jsp?shape=line");//转发时，路径不要带项目名
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost( request,  response);
    }
}
