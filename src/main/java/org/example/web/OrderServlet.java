package org.example.web;

import com.alibaba.fastjson.JSON;
import org.example.SendQQEmail;
import org.example.pojo.*;
import org.example.service.ProductService;
import org.example.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet("/order/*")
public class OrderServlet extends BaseServlet {
    private OrderServiceImpl orderService = new OrderServiceImpl();

    /**
     * 分页条件查询
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void selectByPageAndUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("order selectByPageAndUser");
        //1. 接收 当前页码 和 每页展示条数    url?currentPage=1&pageSize=5
        String _currentPage = request.getParameter("currentPage");
        String _pageSize = request.getParameter("pageSize");

        int currentPage = Integer.parseInt(_currentPage);
        int pageSize = Integer.parseInt(_pageSize);

        // 获取查询条件对象
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 Product
        User user = JSON.parseObject(params, User.class);

        // 使用session
        HttpSession session = request.getSession();
        User _user = (User) session.getAttribute("user");
        System.out.println("user " + user);
        System.out.println("_user " + _user);
        PageBean<OrderView> pageBean;
        if (_user == null) {
            //2. 调用service查询
            pageBean = orderService.selectByPageAndCondition(currentPage, pageSize, user.getUsername());
        } else {
            //2. 调用service查询
            pageBean = orderService.selectByPageAndCondition(currentPage, pageSize, _user.getUsername());
        }

        //2. 转为JSON
        String jsonString = JSON.toJSONString(pageBean);
        //3. 写数据

        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }


    /**
     * 多条件查询
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void selectByPageAndMultiCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("order selectByPageAndMultiCondition");
        //1. 接收 当前页码 和 每页展示条数    url?currentPage=1&pageSize=5
        String _currentPage = request.getParameter("currentPage");
        String _pageSize = request.getParameter("pageSize");

        int currentPage = Integer.parseInt(_currentPage);
        int pageSize = Integer.parseInt(_pageSize);

        // 获取查询条件对象
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 OrderView
        OrderView orderView = JSON.parseObject(params, OrderView.class);
//        System.out.println("orderView order selectByPageAndMultiCondition");
//        System.out.println(orderView);

        //若userId==0则使用条件中加上当前用户
        if (orderView.getUserId() != null && orderView.getUserId() == 0) {
            // 使用session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("user");
            orderView.setUserId(user.getId());
        }
//        System.out.println("orderView order selectByPageAndMultiCondition");
//        System.out.println(orderView);

        //2. 调用service查询
        PageBean<OrderView> pageBean = orderService.selectByPageAndMultiCondition(currentPage, pageSize, orderView);

        //2. 转为JSON
        String jsonString = JSON.toJSONString(pageBean);
        //3. 写数据

        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    /**
     * 多条件查询
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void selectByMultiCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("order selectByMultiCondition");

        // 获取查询条件对象
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 Product
        OrderView orderView = JSON.parseObject(params, OrderView.class);
        System.out.println(orderView);
        //2. 调用service查询
        Analysis analysis = orderService.selectByMultiCondition(orderView);

        //2. 转为JSON
        String jsonString = JSON.toJSONString(analysis);
        //3. 写数据
        System.out.println(jsonString);

        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("order add");
        //1. 接收数据
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串
        System.out.println(params);
        //转为OrderView对象
        OrderView orderView = JSON.parseObject(params, OrderView.class);

        //获取存储到session中的user
        HttpSession session = request.getSession();
        User _user = (User) session.getAttribute("user");
        System.out.println("_user " + _user);
        response.setContentType("text/json;charset=utf-8");
        if (_user == null) {
            response.getWriter().write("loginStatusError");
        } else {
            //调用service添加
            orderService.add(_user.getId(), orderView.getProductId(), orderView.getAddress());
            SendQQEmail sendQQEmail = new SendQQEmail("您购买的《"+orderView.getName()+"》已经准备发货！", _user.getEmail());
            sendQQEmail.start();
            //响应成功的标识
            response.getWriter().write("success");
        }

    }

}
