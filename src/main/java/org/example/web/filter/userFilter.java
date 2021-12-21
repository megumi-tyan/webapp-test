package org.example.web.filter;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;

@WebFilter("/*")
public class userFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String[] urls = {"/user_cart.html","/user_order.html"};
        // 获取当前访问的资源路径
        String url = req.getRequestURL().toString();
        //循环判断
        for (String u : urls) {
            if(url.contains(u)){
                //1. 判断session中是否有user
                HttpSession session = req.getSession();
                Object user = session.getAttribute("user");
                //2. 判断user是否为null
                if(user != null){
                    // 登录过了，放行
                    chain.doFilter(request, response);
                }else {
                    // 没有登陆，存储提示信息，跳转到登录页面
                    resp.sendRedirect("/web-app/homepage.html");
                }
            }
        }
        //放行
        chain.doFilter(request, response);
        //break;
        return;
    }
}
