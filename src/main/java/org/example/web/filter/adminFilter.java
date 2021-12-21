package org.example.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/*")
public class adminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        String[] urls = {"/backstage.html"};
        // 获取当前访问的资源路径
        String url = req.getRequestURL().toString();

        //循环判断
        for (String u : urls) {
            if(url.contains(u)){
                //找到了
                //1. 判断session中是否有user
                HttpSession session = req.getSession();
                Object admin = session.getAttribute("admin");

                //2. 判断user是否为null
                if(admin != null){
                    // 登录过了
                    chain.doFilter(request, response);
                }else {
                    resp.sendRedirect("/web-app/backstage_login.html");
                }

            }
        }
        //放行
        chain.doFilter(request, response);
        //break;

    }
}
