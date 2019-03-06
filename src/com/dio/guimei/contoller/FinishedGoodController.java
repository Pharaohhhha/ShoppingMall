package com.dio.guimei.contoller;

import com.dio.guimei.dao.finishedGoodDao.FinishedGoodDao;
import com.dio.guimei.vo.Page;
import com.dio.guimei.vo.finishedFoodVo.FinishedGood;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by 123 on 2018/8/31.
 */
//@Controller
//public class FinishedGoodController {
//    @RequestMapping("/queryAll")
//    public String queryAll(FinishedGood finishedGood, HttpServletRequest request, HttpSession session){
//
//        //分页查询库存
//        session.setAttribute("FinishedGoodCondition", finishedGood);
//        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();
//
//        List<FinishedGood> FinishedGoodList = null;
//
//        Page page = (Page) session.getAttribute("FinishedGoodPage");
//        if (session.getAttribute("FinishedGoodPage") == null
//    || StringUtils.isBlank(request.getParameter("pageNo"))) {
//            //第一次请求
//            //获得总记录数
//            page = new Page<FinishedGood>();
//            page.setPageNo(1);
//            page.setPageSize(6);
//
//            page.setQueryObject(finishedGood);
//
//            int totalRow = finishedGoodDao.countForPage(page);
//            page.setTotalRow(totalRow);
//
//        }else {
//            // 第2次后的请求，也就是说此时用户是点击了： 【第一页】【上一页】【下一页】【最后一页】
//            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));
//
//        }
//        FinishedGoodList = finishedGoodDao.findAll(page);
////        if(FinishedGoodList!=null){
////            session.setAttribute("operation","1");
////            //1查询成功
////        }
//        session.setAttribute("FinishedGoodPage", page);
//        session.setAttribute("FinishedGoodList", FinishedGoodList);
//        session.setAttribute("pageNoForUpdate",request.getParameter("pageNo"));
//        return "redirect:/finishedGoods/dosomething.jsp";
//    }
//
//    @RequestMapping("/delete")
//    public String delete(FinishedGood finishedGood,HttpSession session){
//
//        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();
//
//        Integer delete = finishedGoodDao.delete(finishedGood);
//
//        if(delete!=null){
//            session.setAttribute("operation","2");
//            //2删除成功
//        }
//
//        return   "/finishedGoods/queryAll.do";
//    }
//
//    @RequestMapping("/add")
//    public String add(FinishedGood finishedGood,HttpSession session){
//
//        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();
//
//        Integer add = finishedGoodDao.add(finishedGood);
//
//        if(add!=null){
//            session.setAttribute("operation","3");
//            //3添加成功
//        }
//
//        return   "/queryAll.do";
//    }
//
//    @RequestMapping("/updateFrom")
//    public String updateFrom(FinishedGood finishedGood,HttpServletRequest request,HttpSession session){
//
//        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();
//
//        FinishedGood byId = finishedGoodDao.findById(finishedGood);
//
//        session.setAttribute("originalData",byId);
//
//        return  "/finishedGoods/updateFrom.jsp";
//    }
//
//    @RequestMapping("/update")
//    public String update(FinishedGood finishedGood,HttpSession session){
//
//        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();
//
//        Integer update = finishedGoodDao.update(finishedGood);
//
//        if(update!=null){
//            session.setAttribute("operation","4");
//            //4更新成功
//        }
//
//        return    "/finishedGoods/queryAll.do?pageNo="+session.getAttribute("pageNoForUpdate");
//    }
//
//}
@Controller
public class FinishedGoodController {
    @RequestMapping("/queryAll")
    public String queryAll(FinishedGood finishedGood, HttpServletRequest request, HttpSession session){
        if(request.getParameter("key") != null){
            session.setAttribute("operation","1");
        }
        if(request.getParameter("pageNo") != null){
            session.setAttribute("operation","0");
        }

        //分页查询库存
        session.setAttribute("FinishedGoodCondition", finishedGood);
        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();

        List<FinishedGood> FinishedGoodList = null;

        Page page = (Page) session.getAttribute("FinishedGoodPage");
        if (session.getAttribute("FinishedGoodPage") == null
                || StringUtils.isBlank(request.getParameter("pageNo"))) {
            //第一次请求
            //获得总记录数
            page = new Page<FinishedGood>();
            page.setPageNo(1);
            page.setPageSize(6);

            page.setQueryObject(finishedGood);

            int totalRow = finishedGoodDao.countForPage(page);
            page.setTotalRow(totalRow);

        }else {
            // 第2次后的请求，也就是说此时用户是点击了： 【第一页】【上一页】【下一页】【最后一页】
            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));

        }
        FinishedGoodList = finishedGoodDao.findAll(page);
//        if(FinishedGoodList!=null){
//            session.setAttribute("operation","1");
//            //1查询成功
//        }
        session.setAttribute("FinishedGoodPage", page);
        session.setAttribute("FinishedGoodList", FinishedGoodList);
        session.setAttribute("pageNoForUpdate",request.getParameter("pageNo"));


        return "redirect:/finishedGoods/dosomething.jsp?modelId=6";
    }

    @RequestMapping("/delete")
    public String delete(FinishedGood finishedGood,HttpSession session){

        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();

        Integer delete = finishedGoodDao.delete(finishedGood);

        if(delete!=null){
            session.setAttribute("operation","2");
            //2删除成功
        }

        return   "queryAll.do";
    }

    @RequestMapping("/add")
    public String add(FinishedGood finishedGood,HttpSession session){

        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();

        Integer add = finishedGoodDao.add(finishedGood);

        if(add!=null){
            session.setAttribute("operation","3");
            //3添加成功
        }

        return   "queryAll.do";
    }

    @RequestMapping("/updateFrom")
    public String updateFrom(FinishedGood finishedGood,HttpServletRequest request,HttpSession session){

        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();

        FinishedGood byId = finishedGoodDao.findById(finishedGood);

        session.setAttribute("originalData",byId);

        return  "/finishedGoods/updateFrom.jsp";
    }

    @RequestMapping("/update")
    public String update(FinishedGood finishedGood,HttpSession session){

        FinishedGoodDao finishedGoodDao = new FinishedGoodDao();

        Integer update = finishedGoodDao.update(finishedGood);

        if(update!=null){
            session.setAttribute("operation","4");
            //4更新成功
        }

//        return    "queryAll.do?pageNo="+session.getAttribute("pageNoForUpdate");
        return    "queryAll.do";
    }

}
