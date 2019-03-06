package com.dio.guimei.contoller;

import com.dio.guimei.dao.vendor.VendorDao;
import com.dio.guimei.vo.Page;

import com.dio.guimei.vo.vendor.Vendor;
import com.lanqiao.web.mvc.annotation.Controller;
import com.lanqiao.web.mvc.annotation.RequestMapping;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by HelloWorld on 2018/8/31.
 */
@Controller
public class VendorContoller {
    //    @RequestMapping("/vendor_list")
//    public String list(HttpServletRequest request, HttpSession session) throws SQLException {
//        VendorDao vendorDao = new VendorDao();
//        if(request.getParameter("pageNo")!=null){
//            session.removeAttribute("vendorStatusCode");
//        }
//        List<Vendor> vendors = null;
//        Page page = (Page) session.getAttribute("vendorPage");
//        int totalRow = vendorDao.countForVender();
//
//        if (session.getAttribute("vendorPage") == null) {
//            page = new Page(totalRow);
//            page.setPageNo(1);
//            page.setPageSize(3);
//        } else {
//            page.setTotalRow(totalRow);
//            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));
//        }
//        vendors = vendorDao.findAll(page);
//        session.setAttribute("vendorPage", page);
//        request.setAttribute("vendors", vendors);
//        if (vendors != null) {
//            return "/supplier/vendors.jsp";
//        }
//        return null;
//    }
    @RequestMapping("/vendor_list")
    public String find(Vendor vendor,HttpServletRequest request, HttpSession session) throws SQLException {
        VendorDao vendorDao = new VendorDao();
        List<Vendor> vendors = null;

        Page<Vendor> page = (Page) session.getAttribute("vendorPage");
        if(request.getParameter("pageNo")!=null){
            session.removeAttribute("vendorStatusCode");
        }
        session.setAttribute("vendorsList", vendor);

        if (session.getAttribute("vendorPage") == null
                || StringUtils.isBlank(request.getParameter("pageNo"))) {
            page = new Page<Vendor>();
            page.setPageNo(1);
            page.setPageSize(3);
            page.setQueryObject(vendor);
            int totalRow = vendorDao.countForVender(page);
            page.setTotalRow(totalRow);
        } else {
            page.setPageNo(NumberUtils.toInt(request.getParameter("pageNo"), 1));
        }
        vendors = vendorDao.findByMsg(page);
        session.setAttribute("vendorPage", page);
        request.setAttribute("vendors", vendors);
        if (vendors != null) {
            return "/supplier/vendors.jsp";
        }
        return null;
    }

    @RequestMapping("/vendor_update")
    public String update(Vendor v,HttpServletRequest request,HttpSession session) throws SQLException {
        session.removeAttribute("vendorStatusCode");
        int i = new VendorDao().update(v);
        if (i==1) {
            session.setAttribute("vendorStatusCode", "update");
            return find(v,request,session);
        }
        return "/supplier/vendors.jsp";
    }

    @RequestMapping("/vendor_delete")
    public String delete(Vendor v, HttpServletRequest request, HttpSession session, HttpServletResponse response)
            throws SQLException, IOException {
        session.removeAttribute("vendorStatusCode");
        int i = new VendorDao().delete(v);
        if (i == 1) {
            session.setAttribute("vendorStatusCode", "delete");
            return find(v,request,session);
        }
        return null;
    }

    @RequestMapping("/vendor_add")
    public String add(Vendor v, HttpServletRequest request, HttpSession session, HttpServletResponse response)
            throws SQLException {
        session.removeAttribute("vendorStatusCode");
        int i = new VendorDao().add(v);
        if (i == 1) {
            session.setAttribute("vendorStatusCode", "add");
            return find(v,request,session);
        }
        return null;
    }
}
