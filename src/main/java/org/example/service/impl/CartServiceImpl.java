package org.example.service.impl;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.example.mapper.CartMapper;
import org.example.mapper.ProductMapper;
import org.example.pojo.OrderView;
import org.example.pojo.PageBean;
import org.example.service.CartService;
import org.example.util.SqlSessionFactoryUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class CartServiceImpl implements CartService {
    //1. 创建SqlSessionFactory 工厂对象
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    @Override
    public PageBean<OrderView> selectByPageAndCondition(int currentPage, int pageSize, String username) {
        System.out.println("selectByPageAndCondition");
//        System.out.println(currentPage);
//        System.out.println(pageSize);
        System.out.println(username);
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        CartMapper mapper = sqlSession.getMapper(CartMapper.class);

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
        System.out.println(rows.size());
        System.out.println(rows);
        System.out.println("ok2");
//        String jsonString = JSON.toJSONString(rows);
//        System.out.println(jsonString);


        //7. 封装PageBean对象
        PageBean<OrderView> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        //8. 释放资源
        sqlSession.close();

        return pageBean;

    }

    @Override
    public void add(Integer userId, Integer productId) {
        System.out.println("cart add");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取CartMapper
        CartMapper mapper = sqlSession.getMapper(CartMapper.class);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        String time = df.format(new Date());
        //4. 调用方法
        mapper.add(userId, productId, time);
        sqlSession.commit();//提交事务

        //5. 释放资源
        sqlSession.close();
    }

    @Override
    public void deleteByIds(int[] ids) {
        System.out.println("deleteByIds");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        CartMapper mapper = sqlSession.getMapper(CartMapper.class);
        System.out.println(ids);
        for(int i:ids)
            System.out.println(i);
        //4. 调用方法
        mapper.deleteByIds(ids);

        sqlSession.commit();//提交事务

        //5. 释放资源
        sqlSession.close();
    }


}
