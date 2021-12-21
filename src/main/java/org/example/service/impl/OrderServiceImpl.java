package org.example.service.impl;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.example.mapper.CartMapper;
import org.example.mapper.OrderMapper;
import org.example.mapper.ProductMapper;
import org.example.pojo.Analysis;
import org.example.pojo.OrderBookClass;
import org.example.pojo.OrderView;
import org.example.pojo.PageBean;
import org.example.service.OrderService;
import org.example.util.SqlSessionFactoryUtils;

import java.text.SimpleDateFormat;
import java.util.*;

public class OrderServiceImpl implements OrderService {

    //1. 创建SqlSessionFactory 工厂对象
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

//    @Override
//    public PageBean<Product> selectByPageAndCondition(int currentPage, int pageSize, Product product) {
//        System.out.println("selectByPageAndCondition");
////        System.out.println(currentPage);
////        System.out.println(pageSize);
////        System.out.println(product);
//        //2. 获取SqlSession对象
//        SqlSession sqlSession = factory.openSession();
//        //3. 获取BrandMapper
//        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
//
////        System.out.println("ok111");
//        //4. 计算开始索引
//        int begin = (currentPage - 1) * pageSize;
//        // 计算查询条目数
//        int size = pageSize;
//
//        // 处理product条件，模糊表达式
//        String name = product.getName();
//        if (name != null && name.length() > 0) {
//            product.setName("%" + name + "%");
//        }
//
//        String description = product.getDescription();
//        if (description != null && description.length() > 0) {
//            product.setDescription("%" + description + "%");
//        }
////        System.out.println("ok1101");
//
//        //6. 查询总记录数
//        int totalCount = mapper.selectTotalCountByCondition(product);
//        System.out.println(totalCount);
//        System.out.println("ok1");
//        List<Product> rows;
//        //5. 查询当前页数据
//
//        if(totalCount>begin){
//            System.out.println("c1");
//            rows = mapper.selectByPageAndCondition(begin, size, product);
////            System.out.println(rows);
//        }
//        else{
//            System.out.println("c2");
//            rows = mapper.selectByPageAndCondition(0, size, product);
////            System.out.println(rows);
//        }
//        System.out.println("ok2");
////        String jsonString = JSON.toJSONString(rows);
////        System.out.println(jsonString);
//
//
//        //7. 封装PageBean对象
//        PageBean<Product> pageBean = new PageBean<>();
//        pageBean.setRows(rows);
//        pageBean.setTotalCount(totalCount);
//
//        //8. 释放资源
//        sqlSession.close();
//
//        return pageBean;
//    }

    @Override
    public PageBean<OrderView> selectByPageAndCondition(int currentPage, int pageSize, String username) {
        System.out.println("selectByPageAndCondition");
        System.out.println(currentPage);
        System.out.println(pageSize);
        System.out.println(username);
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

//        System.out.println("ok111");
        //4. 计算开始索引
        int begin = (currentPage - 1) * pageSize;
        // 计算查询条目数
        int size = pageSize;

//        System.out.println("ok1101");

        //6. 查询总记录数
        int totalCount = mapper.selectTotalCountByCondition(username);
        System.out.println(totalCount);
        System.out.println("ok1");
        List<OrderView> rows;
        //5. 查询当前页数据

        if (totalCount > begin) {
            System.out.println("c1");
            rows = mapper.selectByPageAndCondition(begin, size, username);
//            System.out.println(rows);
        } else {
            System.out.println("c2");
            rows = mapper.selectByPageAndCondition(0, size, username);
//            System.out.println(rows);
        }
        System.out.println("ok2");
        String jsonString = JSON.toJSONString(rows);
        System.out.println(jsonString);


        //7. 封装PageBean对象
        PageBean<OrderView> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        //8. 释放资源
        sqlSession.close();

        return pageBean;

    }

    @Override
    public PageBean<OrderView> selectByPageAndMultiCondition(int currentPage, int pageSize, OrderView orderView) {
        System.out.println("selectByPageAndMultiCondition");
//        System.out.println(currentPage);
//        System.out.println(pageSize);
//        System.out.println(orderView);
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

        //4. 计算开始索引
        int begin = (currentPage - 1) * pageSize;
        // 计算查询条目数
        int size = pageSize;

        // 处理orderView条件，模糊表达式
        String name = orderView.getName();
        if (name != null && name.length() > 0) {
            orderView.setName("%" + name + "%");
        }
        String description = orderView.getDescription();
        if (description != null && description.length() > 0) {
            orderView.setDescription("%" + description + "%");
        }
        String address = orderView.getAddress();
        if (address != null && address.length() > 0) {
            orderView.setAddress("%" + address + "%");
        }
//        System.out.println(orderView);
        //6. 查询总记录数
        int totalCount = mapper.selectTotalCountByMultiCondition(orderView);
//        System.out.println(totalCount);
//        System.out.println("ok1");
        List<OrderView> rows;
        //5. 查询当前页数据

        if (totalCount > begin) {
            System.out.println("c1");
            rows = mapper.selectByPageAndMultiCondition(begin, size, orderView);
//            System.out.println(rows);
        } else {
            System.out.println("c2");
            rows = mapper.selectByPageAndMultiCondition(0, size, orderView);
//            System.out.println(rows);
        }
        System.out.println("ok2");
        String jsonString = JSON.toJSONString(rows);
        System.out.println(jsonString);


        //7. 封装PageBean对象
        PageBean<OrderView> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        //8. 释放资源
        sqlSession.close();

        return pageBean;

    }

    @Override
    public Analysis selectByMultiCondition(OrderView orderView) {
        System.out.println("selectByMultiCondition");
//        System.out.println(orderView);
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
        System.out.println(orderView);
        // 处理orderView条件，模糊表达式
        String name = orderView.getName();
        if (name != null && name.length() > 0) {
            orderView.setName("%" + name + "%");
        }
        String description = orderView.getDescription();
        if (description != null && description.length() > 0) {
            orderView.setDescription("%" + description + "%");
        }
        String address = orderView.getAddress();
        if (address != null && address.length() > 0) {
            orderView.setAddress("%" + address + "%");
        }
//        System.out.println(orderView);

        //6. 查询总记录数
        int totalCount = mapper.selectTotalCountByMultiCondition(orderView);
//        System.out.println(totalCount);
//        System.out.println("ok1");

        //5. 查询所有数据
        List<OrderView> rows = mapper.selectByMultiCondition(orderView);
//        System.out.println("ok2");

        Double totalSales = 0.0;
        Integer totalOrderNum = rows.size();
        List<OrderBookClass> orderBookClasses = new ArrayList<>();


        for (int i = 0; i < rows.size(); i++) {
            OrderView x = rows.get(i);
            totalSales += x.getPrice();

            String className = x.getDescription().substring(0, x.getDescription().indexOf("类"));
            boolean flag = false;
            if(orderBookClasses!=null){
//                System.out.println("orderBookClasses!=null");
                for (int j = 0; j < orderBookClasses.size(); j++) {
//                    System.out.println(className+" ?= "+orderBookClasses.get(j).getClassName());
                    if (orderBookClasses.get(j).getClassName().equals(className)) {
                        //已有这一类的情况
                        flag = true;
                        orderBookClasses.get(j).setClassTotalSale(orderBookClasses.get(j).getClassTotalSale() + x.getPrice());
                        orderBookClasses.get(j).setClassTotalOrderNum(orderBookClasses.get(j).getClassTotalOrderNum() + 1);
                        break;
                    }
                }
            }
            if(!flag){
                //还没有这一类
                OrderBookClass temp = new OrderBookClass();
                temp.setClassName(className);
                temp.setClassTotalSale(x.getPrice());
                temp.setClassTotalOrderNum(1);
                orderBookClasses.add(temp);
            }
        }

        //7. 封装对象
        Analysis analysis = new Analysis();
        analysis.setTotalSales(totalSales);
        analysis.setTotalOrderNum(totalOrderNum);
        analysis.setOrderBookClasses(orderBookClasses);

//        String jsonString = JSON.toJSONString(analysis);
//        System.out.println(jsonString);

        //8. 释放资源
        sqlSession.close();

        return analysis;
    }

    @Override
    public void add(Integer userId, Integer productId, String address) {
        System.out.println("order add");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取OrderMapper
        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        String time = df.format(new Date());
        //4. 调用方法
        mapper.add(userId, productId, time, address);
        sqlSession.commit();//提交事务

        //5. 释放资源
        sqlSession.close();
    }

//    @Override
//    public void deleteByIds(int[] ids) {
//        System.out.println("deleteByIds");
//        //2. 获取SqlSession对象
//        SqlSession sqlSession = factory.openSession();
//        //3. 获取BrandMapper
//        OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);
//
//        //4. 调用方法
//        mapper.deleteByIds(ids);
//
//        sqlSession.commit();//提交事务
//
//        //5. 释放资源
//        sqlSession.close();
//    }

}
