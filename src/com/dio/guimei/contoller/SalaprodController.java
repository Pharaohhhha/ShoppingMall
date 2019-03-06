package com.dio.guimei.contoller;

import com.dio.guimei.dao.saledao.SalaprodDao;

import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.tc.Salaprod;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.util.List;

/**
 * Created by TCCCC on 2018/9/2/002.
 */
@Controller
public class SalaprodController {
    @RequestMapping("/Salaprod_queryAll")
    public String queryAll(Salaprod salaprod,HttpServletRequest request, HttpSession session){
        if(request.getParameter("key")  != null){
            session.setAttribute("numberr","1");
        }
        if(request.getParameter("pageNo")  != null){
            session.setAttribute("numberr","0");
        }
        session.setAttribute("SalaprodCondition", salaprod);
        SalaprodDao salaprodDao = new SalaprodDao();
        List<Salaprod> SalaprodList=null;
        Page page = (Page) session.getAttribute("SalaprodPage");
        if (session.getAttribute("SalaprodPage") == null
                || StringUtils.isBlank(request.getParameter("pageNo"))) {
            //第一次请求
            //获得总记录数
            page = new Page<Salaprod>();
            page.setPageNo(1);
            page.setPageSize(6);
            page.setQueryObject(salaprod);

            int totalRow = salaprodDao.countForPage(page);
            page.setTotalRow(totalRow);

        }else {
            // 第2次后的请求，也就是说此时用户是点击了： 【第一页】【上一页】【下一页】【最后一页】
            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));
        }
        SalaprodList = salaprodDao.findAll(page);
        session.setAttribute("SalaprodPage", page);
        session.setAttribute("SalaprodList", SalaprodList);
        session.setAttribute("pageNoForUpdate",request.getParameter("pageNo"));

        return "redirect:/salaprod/index.jsp?modelId=4";
    }

    @RequestMapping("/Salaprod_delete")
    public String delete(Salaprod salaprod,HttpSession session){

        SalaprodDao salaprodDao = new SalaprodDao();

        Integer delete = salaprodDao.delete(salaprod);

        if(delete!=null){
            session.setAttribute("numberr","2");
            //2删除成功
        }

        return   "/Salaprod_queryAll.do";
    }

    @RequestMapping("/Salaprod_add")
    public String add(Salaprod salaprod,HttpSession session){

        SalaprodDao salaprodDao = new SalaprodDao();

        Integer add = salaprodDao.add(salaprod);

        if(add!=null){
            session.setAttribute("numberr","3");
            //3添加成功
        }

        return   "/Salaprod_queryAll.do";
    }

    @RequestMapping("/Salaprod_updateFrom")
    public String updateFrom(Salaprod salaprod,HttpServletRequest request,HttpSession session){

        SalaprodDao salaprodDao = new SalaprodDao();

        Salaprod byId = salaprodDao.findById(salaprod);

        session.setAttribute("originalData",byId);

        return  "/salaprod/updateFrom.jsp";
    }

    @RequestMapping("/Salaprod_update")
    public String update(Salaprod salaprod,HttpSession session){

        SalaprodDao salaprodDao = new SalaprodDao();

        Integer update = salaprodDao.update(salaprod);

        if(update!=null){
            session.setAttribute("numberr","4");
            //4更新成功
        }
        return  "/Salaprod_queryAll.do";
    }
}
