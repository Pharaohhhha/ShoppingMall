package com.dio.guimei.filter;

import com.sun.org.apache.xpath.internal.SourceTree;
import org.apache.commons.lang3.StringUtils;
import sun.applet.Main;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by 123 on 2018/8/30.
 */
@WebFilter(filterName = "AuthorticationFilter", value = {"*.do","*.jsp"})
public class AuthorticationFilter implements Filter {


    @Override
    public void init(FilterConfig config) throws ServletException {
//        config.getInitParameter("");
    }

    @Override
    public void destroy() {
    }

    /**
     * @param req   - 请求
     * @param resp  - 响应
     * @param chain     - 过滤器链
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException {
        //过滤的处理操作
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        //获得当前请求的路径，看是不是登录的请求
        String uri = request.getRequestURI();

        HttpSession session = request.getSession();
        if (!StringUtils.endsWith(uri, "login.jsp")) {
            if (session.getAttribute("logUser") != null) {
                //已登录
                //将请求和响应分发出去给后继的WEB组件去处理
                chain.doFilter(req, resp);
                return;
            } else {
                if (StringUtils.endsWith(uri, "user/login.do")) {
                    //当前为登录请求，放行
                    chain.doFilter(req, resp);
                    return;
                } else {
                    //未登录时访问受限资源
                    response.sendRedirect(request.getContextPath() + "/login.jsp?nolog=0");
                    return;
                }
            }

            // books/list.do --> DispactcherServl.doPost() ｜ doGet()

        }else {
            chain.doFilter(req, resp);
        }
    }

}

