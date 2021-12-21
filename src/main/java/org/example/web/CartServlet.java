package org.example.web;

import com.alibaba.fastjson.JSON;
import org.example.pojo.OrderView;
import org.example.pojo.PageBean;
import org.example.pojo.Product;
import org.example.pojo.User;
import org.example.service.impl.CartServiceImpl;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet("/cart/*")
public class CartServlet extends BaseServlet {
    private CartServiceImpl cartService = new CartServiceImpl();

    /**
     * 分页条件查询
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void selectByPageAndCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("cart selectByPageAndCondition");
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

        //获取存储到session中的user
        HttpSession session = request.getSession();
        User _user = (User) session.getAttribute("user");
        System.out.println("user "+user);
        System.out.println("_user "+_user);
        //2. 调用service查询
        PageBean<OrderView> pageBean;
        if(_user==null) {
            pageBean = cartService.selectByPageAndCondition(currentPage, pageSize, user.getUsername());
        }else{
            pageBean = cartService.selectByPageAndCondition(currentPage, pageSize, _user.getUsername());
        }

        //2. 转为JSON
        String jsonString = JSON.toJSONString(pageBean);
        //3. 写数据

        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }


    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("CartServlet add");
        //1. 接收品牌数据
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串
        System.out.println(params);
        //转为Product对象
        Integer productId = JSON.parseObject(params, Integer.class);

        //获取存储到session中的user
        HttpSession session = request.getSession();
        User _user = (User) session.getAttribute("user");
        System.out.println("_user "+_user);
        response.setContentType("text/json;charset=utf-8");
        if(_user==null){
            response.getWriter().write("loginStatusError");
        }
        else{
            Integer userId = _user.getId();
            //2. 调用service添加
            cartService.add(userId, productId);

            //3. 响应成功的标识
            response.getWriter().write("success");
        }

    }

    /**
     * 批量删除
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteByIds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("CartServlet deleteByIds");
        //1. 接收数据  [1,2,3]
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 int[]
        int[] ids = JSON.parseObject(params, int[].class);
        System.out.println(ids);
        for(int i:ids)
            System.out.println(i);
        //2. 调用service添加
        cartService.deleteByIds(ids);

        //3. 响应成功的标识
        response.getWriter().write("success");
    }


}
