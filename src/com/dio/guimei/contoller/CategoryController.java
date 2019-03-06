package com.dio.guimei.contoller;

/**
 * Created by xxxx on 2018/9/1.
 */


import com.dio.guimei.dao.category.CategoryDao;
import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.category.BigCtgr;
import com.dio.guimei.vo.category.Category;
import com.google.gson.Gson;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;


@Controller
public class CategoryController {
    @RequestMapping("/category_getCategorys")
    public void list(HttpServletResponse resp) throws IOException {
        List<BigCtgr> bigCtgrs = new CategoryDao().queryBig();
        //把列表转换成JSON
        String json = new Gson().toJson(bigCtgrs);
        //响应回去的是一个字符串，但此字符串是JSON格式
        resp.getWriter().write(json);
    }



//    @RequestMapping("/category/getCategoryList")
//    public String list(HttpServletRequest request){
//        String bigCtgr = request.getParameter("big_ctgr");
//        List<Category> categories = new CategoryDao().querySmall(bigCtgr);
//        request.setAttribute("categories",categories);
//        return "/category/categoryMain.jsp";
//    }

    @RequestMapping("/category_getCategoryList")
    public String list(Category category,HttpServletRequest request,HttpServletResponse resp,HttpSession session){
        String bigCtgr = request.getParameter("big_ctgr");
        if (bigCtgr!=null){
            session.setAttribute("s_big_ctgr",bigCtgr);
        }
        String s_big_ctgr = (String)session.getAttribute("s_big_ctgr");
        CategoryDao categoryDao = new CategoryDao();
        List<Category> categoryList = null;

        Page<Category> page = (Page<Category>) session.getAttribute("category_page");
        // 带查询条件的分页要这样写
        if (session.getAttribute("category_page") == null
                || StringUtils.isBlank(request.getParameter("pageNo"))) {
            //第一次请求
            //获得总记录数
            page = new Page<Category>();
            page.setPageNo(1);
            page.setPageSize(5);
            page.setQueryObject(category);

            int totalRow = categoryDao.countForPage(s_big_ctgr,page);
            page.setTotalRow(totalRow);

        }else {
            // 第2次后的请求，也就是说此时用户是点击了： 【第一页】【上一页】【下一页】【最后一页】
            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));
        }

        categoryList = categoryDao.findAll(s_big_ctgr,page);
        session.setAttribute("category_page", page);
        session.setAttribute("categories",categoryList);
        //request forward
        return "redirect:/category/categoryMain.jsp";
    }

    @RequestMapping("/category_readyUpdate")
    public String update(HttpServletRequest request){
        String _id = request.getParameter("ctgrId");
        Integer ctgrId = Integer.valueOf(_id);
        Category category = new CategoryDao().queryById(ctgrId);
        request.setAttribute("cgy",category);
        return "/category/updateForm.jsp";
    }


    @RequestMapping("/category_doUpdate")
    public void doUpdate(HttpServletRequest request,HttpServletResponse resp) throws IOException {
        String _id = request.getParameter("ctgr_id");
        Integer ctgrId = Integer.valueOf(_id);
        String ctgrName = request.getParameter("new_ctgr_name");
        String bigCtgr = request.getParameter("new_big_ctgr");
        int i = new CategoryDao().update(new Category(ctgrId,ctgrName,bigCtgr));
        if(i!=0){ //success
            resp.getWriter().write("{\"actionFlag\": true}");
        }else { //fail
            resp.getWriter().write("{\"actionFlag\": false}");
        }
    }

    @RequestMapping("/category_readyAdd")
    public String add(HttpServletRequest request){
        return "/category/addForm.jsp";
    }

    @RequestMapping("/category_doAdd")
    public void doAdd(HttpServletRequest request,HttpServletResponse resp) throws IOException {
        String ctgrName = request.getParameter("add_ctgr_name");
        String bigCtgr = request.getParameter("add_big_ctgr");
        int i = new CategoryDao().save(new Category(null,ctgrName,bigCtgr));
        if(i!=0){ //success
            resp.getWriter().write("{\"actionFlag\": true}");
        }else { //fail
            resp.getWriter().write("{\"actionFlag\": false}");
        }
    }

    @RequestMapping("/category_delete")
    public void doDelete(HttpServletRequest request,HttpServletResponse resp) throws IOException {
        String _id = request.getParameter("ctgrId");
        Integer id = Integer.valueOf(_id);
        int i = new CategoryDao().delete(id);
        if(i!=0){ //success
            resp.getWriter().write("{\"actionFlag\": true}");
        }else { //fail
            resp.getWriter().write("{\"actionFlag\": false}");
        }
    }
}
