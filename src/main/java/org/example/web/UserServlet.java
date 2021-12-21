package org.example.web;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.example.pojo.PageBean;
import org.example.pojo.Product;
import org.example.pojo.User;
import org.example.service.ProductService;
import org.example.service.UserService;
import org.example.service.impl.ProductServiceImpl;
import org.example.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet("/user/*")
public class UserServlet extends BaseServlet {
    private UserService userService = new UserServiceImpl();

    /**
     * 根据用户名和密码查询用户对象
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void selectUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("user selectUser...");

        // 获取查询条件对象
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 User
        User _user = JSON.parseObject(params, User.class);


        //2. 调用service查询
        User user = userService.select(_user.getUsername(), _user.getPassword());

        String remember = "1";

        //3. 判断
        if (user != null) {
            //登录成功，跳转到查询所有的BrandServlet
            //判断用户是否勾选记住我
            if ("1".equals(remember)) {
                //勾选了，发送Cookie

                //1. 创建Cookie对象
                Cookie c_username = new Cookie("username", URLEncoder.encode(user.getUsername(), "UTF-8"));
                Cookie c_password = new Cookie("password", URLEncoder.encode(user.getPassword(), "UTF-8"));
                Cookie c_email = new Cookie("email", URLEncoder.encode(user.getEmail(), "UTF-8"));
                // 设置Cookie的存活时间
                c_username.setMaxAge(60 * 60 * 24 * 7);
                c_password.setMaxAge(60 * 60 * 24 * 7);
                c_email.setMaxAge(60 * 60 * 24 * 7);
                //2. 发送
                response.addCookie(c_username);
                response.addCookie(c_password);
                response.addCookie(c_email);
            }

            //将登陆成功后的user对象，存储到session
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            User uu = (User) session.getAttribute("user");
            System.out.println("已将用户信息存入session");
            System.out.println(uu);
//            String contextPath = request.getContextPath();
//            response.sendRedirect(contextPath + "/selectAllServlet");
        } else {

            // 登录失败, 存储错误信息到request
            request.setAttribute("login_msg", "用户名或密码错误");
//            // 跳转到login.jsp
//            request.getRequestDispatcher("/login.jsp").forward(request, response);

        }

        //2. 转为JSON
        String jsonString = JSON.toJSONString(user);
        //3. 写数据
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    /**
     * 根据用户名查询用户对象
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void selectByUsername(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("user selectByUsername...");
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 User
        User _user = JSON.parseObject(params, User.class);

        //2. 调用service查询
        User user = userService.selectByUsername(_user.getUsername());

        //2. 转为JSON
        String jsonString = JSON.toJSONString(user);
        //3. 写数据
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);

    }

    /**
     * 添加用户
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("user add...");
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 User
        User _user = JSON.parseObject(params, User.class);
        System.out.println(_user);
        //2. 调用service查询
        userService.add(_user);

        //3. 写数据
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write("success");
    }

    public void getLoginStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("user getLoginStatus...");

        HttpSession session = request.getSession();
        User uu = (User) session.getAttribute("user");
        System.out.println(uu);
        System.out.println("okk");
        //3. 写数据
        boolean flag = false;
        response.setContentType("text/json;charset=utf-8");
        if (uu != null) {
            //2. 调用service查询
            User user = userService.select(uu.getUsername(), uu.getPassword());
            System.out.println(user);
            //2. 转为JSON
            String jsonString = JSON.toJSONString(user);
            //3. 写数据
            response.getWriter().write(jsonString);
        }

    }
}

