package org.example.service.impl;

import com.alibaba.fastjson.JSON;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.example.mapper.ProductMapper;
import org.example.pojo.PageBean;
import org.example.pojo.Product;
import org.example.service.ProductService;
import org.example.util.SqlSessionFactoryUtils;

import java.util.List;

public class ProductServiceImpl implements ProductService {
    //1. 创建SqlSessionFactory 工厂对象
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();
    @Override
    public PageBean<Product> selectByPageAndCondition(int currentPage, int pageSize, Product product) {
        System.out.println("ProductServiceImpl selectByPageAndCondition");
//        System.out.println(currentPage);
//        System.out.println(pageSize);
//        System.out.println(product);
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取ProductMapper
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);

//        System.out.println("ok111");
        //4. 计算开始索引
        int begin = (currentPage - 1) * pageSize;
        // 计算查询条目数
        int size = pageSize;

        // 处理product条件，模糊表达式
        String name = product.getName();
        if (name != null && name.length() > 0) {
            product.setName("%" + name + "%");
        }

        String description = product.getDescription();
        if (description != null && description.length() > 0) {
            product.setDescription("%" + description + "%");
        }
//        System.out.println("ok1101");

        //6. 查询总记录数
        int totalCount = mapper.selectTotalCountByCondition(product);
//        System.out.println(totalCount);
//        System.out.println("ok1");
        List<Product> rows;
        //5. 查询当前页数据

        if(totalCount>begin){
            System.out.println("c1");
            rows = mapper.selectByPageAndCondition(begin, size, product);
//            System.out.println(rows);
        }
        else{
            System.out.println("c2");
            rows = mapper.selectByPageAndCondition(0, size, product);
//            System.out.println(rows);
        }
        System.out.println("ok2");
//        String jsonString = JSON.toJSONString(rows);
//        System.out.println(jsonString);


        //7. 封装PageBean对象
        PageBean<Product> pageBean = new PageBean<>();
        pageBean.setRows(rows);
        pageBean.setTotalCount(totalCount);

        //8. 释放资源
        sqlSession.close();

        return pageBean;
    }

    @Override
    public Integer add(Product product) {
        System.out.println("product add");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取ProductMapper
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
        //4. 调用方法
        Integer id;
        mapper.add(product);
        sqlSession.commit();//提交事务
        id=product.getId();
        //5. 释放资源
        sqlSession.close();
        return id;
    }

    @Override
    public void deleteByIds(int[] ids) {
        System.out.println("deleteByIds");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);

        //4. 调用方法
        mapper.deleteByIds(ids);

        sqlSession.commit();//提交事务

        //5. 释放资源
        sqlSession.close();
    }

    @Override
    public void update(Product product) {
        System.out.println("product update");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取ProductMapper
        ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);

        //4. 调用方法
        mapper.update(product);
        sqlSession.commit();//提交事务

        //5. 释放资源
        sqlSession.close();
    }

}
