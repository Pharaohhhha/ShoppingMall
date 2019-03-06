package com.dio.guimei.contoller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

/**
 *
 * @author 123
 * @date 2018/9/6
 * /servlet/fileUpload
 */
@MultipartConfig
@WebServlet(value = "*.picture")
public class FileUploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到上传文件的part or parts,part对象中封装了上传文件的数据(文件名，文件数据...)
        Part part = request.getPart("file");

        //方式1. JavaEE6这样取，取出是这样：form-data; name="upfile"; filename="syz.jpg"
        //String content = part.getHeader("content-disposition");

        //方式2：getSubmittedFileName()此方法在JAVAEE6没有
        //JavaEE7 新增的方法
        String submittedFileName = part.getSubmittedFileName();

        //应该是将文件上传到tomcat内你的web应用里边
        //得到web应用所布署的位置
        //D:\BlueBridge课件\四川工商3期\02中级源代码\out\artifacts\09_Servlet_fileUpload_war_exploded
        String realPath = request.getServletContext().getRealPath("/userManager/user_images/header");
        System.out.println("应用的真实路径:" + realPath);


        //写上传的文件到目标目录
        part.write(realPath + File.separator + submittedFileName);
        //response.sendRedirect(request.getContextPath() + "/display.jsp?imgName="+submittedFileName);
        response.getWriter().write("{\"success\" : true}");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           doPost( request, response);
    }
}
