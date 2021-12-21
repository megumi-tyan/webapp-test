package org.example.web;

import com.alibaba.fastjson.JSON;
import org.example.pojo.Admin;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;


@WebServlet("/backstageLoginServlet")
public class BackstageLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("backstageLoginServlet...");

        // 获取查询条件对象
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 Admin
        Admin admin = JSON.parseObject(params, Admin.class);

        boolean isAdmin=false;
        if(admin!=null){
            if(admin.getName().equals("admin")&&admin.getPassword().equals("12345678")){
                isAdmin=true;
            }
        }

        //3. 判断
        if (isAdmin) {
            //登录成功

            //将登陆成功后的user对象，存储到session
            HttpSession session = request.getSession();
            session.setAttribute("admin", admin);
            Admin aa = (Admin) session.getAttribute("admin");
            System.out.println("已将管理员信息存入session");
            System.out.println(aa);

            //3. 写数据
            response.setContentType("text/json;charset=utf-8");
            response.getWriter().write("success");
        } else {

            response.setContentType("text/json;charset=utf-8");
            response.getWriter().write("fail");

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
