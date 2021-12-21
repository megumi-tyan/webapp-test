package org.example.web;

import com.alibaba.fastjson.JSON;
import org.example.pojo.PageBean;
import org.example.pojo.Product;
import org.example.service.ProductService;
import org.example.service.impl.ProductServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;


@WebServlet("/product/*")
public class ProductServlet extends BaseServlet {
    private ProductService productService = new ProductServiceImpl();

    /**
     * 分页条件查询
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void selectByPageAndCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ProductServlet selectByPageAndCondition");
        //1. 接收 当前页码 和 每页展示条数
        String _currentPage = request.getParameter("currentPage");
        String _pageSize = request.getParameter("pageSize");
        int currentPage = Integer.parseInt(_currentPage);
        int pageSize = Integer.parseInt(_pageSize);
        // 获取查询条件对象
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串
        //转为 Product
        Product product = JSON.parseObject(params, Product.class);
        //2. 调用service查询
        PageBean<Product> pageBean = productService.selectByPageAndCondition(currentPage, pageSize, product);
        //2. 转为JSON
        String jsonString = JSON.toJSONString(pageBean);
        //3. 写数据
        response.setContentType("text/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    /**
     * 添加商品
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InterruptedException {
        System.out.println("ProductServlet add");
        //1. 接收品牌数据
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为Product对象
        Product product = JSON.parseObject(params, Product.class);
        Integer imgId;
        //2. 调用service添加
        imgId = productService.add(product);

        String startPath = request.getSession().getServletContext().getRealPath("/posts/") + File.separator + "new_image.jpg";
        String endPath = request.getSession().getServletContext().getRealPath("/book_covers/") + File.separator + imgId + ".jpg";
        System.out.println(startPath);
        System.out.println(endPath);
        File startFile = new File(startPath);//获取文件路径
        File endFile = new File(endPath);//获取文件夹路径

        while (!startFile.exists()) {
            System.out.println("add 休眠1秒");
            Thread.sleep(1000 * 1);   // 休眠1秒
        }

        if (endFile.exists()) {
            boolean res = endFile.delete();
            if (!res) {
                System.out.println("Failed to delete file");
            }
        }
        if (!startFile.renameTo(endFile)) {
            System.out.println("Failed to renameTo file");
        }

        //3. 响应成功的标识
        response.getWriter().write("success");
    }

    /**
     * 批量删除
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void deleteByIds(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("ProductServlet deleteByIds");
        //1. 接收数据  [1,2,3]
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串

        //转为 int[]
        int[] ids = JSON.parseObject(params, int[].class);

        //2. 调用service添加
        productService.deleteByIds(ids);

        //3. 响应成功的标识
        response.getWriter().write("success");
    }

    public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InterruptedException {
        System.out.println("ProductServlet update");
        //1. 接收数据
        String isImageUpdated = request.getParameter("isImageUpdated");
        BufferedReader br = request.getReader();
        String params = br.readLine();//json字符串
        System.out.println(isImageUpdated);
        //转为Product对象
        Product product = JSON.parseObject(params, Product.class);
        Integer imgId = product.getId();
        //2. 调用service
        productService.update(product);

        if(isImageUpdated!=null&&isImageUpdated.equals("1")){
            String startPath = request.getSession().getServletContext().getRealPath("/posts/") + File.separator + "new_image.jpg";
            String endPath = request.getSession().getServletContext().getRealPath("/book_covers/") + File.separator + imgId + ".jpg";
            File startFile = new File(startPath);//获取文件路径
            File endFile = new File(endPath);//获取文件夹路径

            while (!startFile.exists()) {
                System.out.println("update 休眠1秒");
                Thread.sleep(1000 * 1);   // 休眠1秒
            }

            if (endFile.exists()) {
                boolean res = endFile.delete();
                if (!res) {
                    System.out.println("Failed to delete file");
                }
            }
            if (!startFile.renameTo(endFile)) {
                System.out.println("Failed to renameTo file");
            }
        }

        //3. 响应成功的标识
        response.getWriter().write("success");
    }

}

