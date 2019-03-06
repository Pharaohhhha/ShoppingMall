package com.dio.guimei.contoller;

import com.dio.guimei.dao.orderdao.OrderDao;
import com.dio.guimei.vo.Page;

import com.dio.guimei.vo.order.Product;
import com.dio.guimei.vo.order.TradeDetail;
import com.dio.guimei.vo.order.Trade_temp;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by wxk on 2018/8/31.
 */

@Controller
public class OrderController {
    @RequestMapping("/list")

    public String list(TradeDetail tradeDetail, HttpServletRequest request, HttpSession session) {
        String select_time=null;
        String select_lgtime=null;
        OrderDao orderDao = new OrderDao();
        if (request.getParameter("select_time") != null) {
            select_time=request.getParameter("select_time");
        }
        if (request.getParameter("select_lgtime") != null) {
            select_lgtime=request.getParameter("select_lgtime");
        }


        List<TradeDetail> tradeDetailsList = null;

        Page<TradeDetail> page = (Page<TradeDetail>) session.getAttribute("order_page");
        // 带查询条件的分页要这样写
        if (session.getAttribute("order_page") == null
                || StringUtils.isBlank(request.getParameter("pageNo"))) {
            //第一次请求
            //获得总记录数

            page = new Page<TradeDetail>();
            page.setPageNo(1);
            page.setPageSize(3);
            page.setQueryObject(tradeDetail);

            int totalRow = orderDao.countForPage(page,select_time,select_lgtime);
            page.setTotalRow(totalRow);

        } else {
            // 第2次后的请求，也就是说此时用户是点击了： 【第一页】【上一页】【下一页】【最后一页】
            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));
        }
        tradeDetailsList = orderDao.findAll(page,select_time,select_lgtime);

        session.setAttribute("order_page", page);
        request.setAttribute("tradeDetailsList", tradeDetailsList);

        //request forward
        return "/order/order.jsp";
    }

    @RequestMapping("/order_delete")
    public String order_delete(TradeDetail tradeDetail, HttpServletRequest request, HttpSession session) throws IOException {

        int i = new OrderDao().delete(tradeDetail.getTrd_no());

        if (i == 1) {

            return list(tradeDetail, request, session);

        } else {
            return null;
        }


    }

    @RequestMapping("/order_detail")
    public String order_detail(HttpServletRequest request, HttpSession session) {
        String trd_no = request.getParameter("trd_no");
        Product order1_product = new OrderDao().findOrder2(trd_no);
        Trade_temp trade_temp = new OrderDao().findOrder1(trd_no);
        session.setAttribute("order1_product", order1_product);
        session.setAttribute("trade_temp", trade_temp);

        return "/order/tradedetail.jsp";



    }


    @RequestMapping("/updateorder")
    public String updateorder(Product product,HttpServletRequest request,HttpSession session){
        System.out.println(product.toString());
        String descr = request.getParameter("descr");

        if (new OrderDao().orderupdate(product)) {

            return order_detail(request, session);

        }

        return null;

    }
    @RequestMapping("/updatebuyerorder")
    public String updatebuyerorder(Trade_temp trade_temp,HttpServletRequest request,HttpSession session){
        System.out.println(trade_temp.toString());
        String trd_no=request.getParameter("trd_no");

        if (new OrderDao().updatebuyer(trade_temp,trd_no)) {
            return order_detail(request, session);

        }

        return null;

    }


}
