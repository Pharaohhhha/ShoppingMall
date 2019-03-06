package com.dio.guimei.servlet;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import java.io.IOException;

/**
 * @author 张建平 on 2018/9/3 10:12
 */
@MultipartConfig //能够处理： multipart/form-data 表单类型的数据
@WebServlet(value = "/servlet/fileUpload")
public class FileUploadServlet extends javax.servlet.http.HttpServlet {
    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        //得到上传文件的part or parts,part对象中封装了上传文件的数据(文件名，文件数据...)
        Part part = request.getPart("upfile");

        //方式1. JavaEE6这样取，取出是这样：form-data; name="upfile"; filename="syz.jpg"
        //String content = part.getHeader("content-disposition");

        //方式2：getSubmittedFileName()此方法在JAVAEE6没有
        //JavaEE7 新增的方法
        String submittedFileName = part.getSubmittedFileName();

        //应该是将文件上传到tomcat内你的web应用里边
        //得到web应用所布署的位置
        //D:\BlueBridge课件\四川工商3期\02中级源代码\out\artifacts\09_Servlet_fileUpload_war_exploded
        String realPath = request.getServletContext().getRealPath("/images");
        System.out.println("应用的真实路径:" + realPath);
        //写上传的文件到目标目录
        part.write(realPath + "\\" + submittedFileName);
        response.sendRedirect(request.getContextPath() + "/display.jsp?imgName="+submittedFileName);
    }

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
