package org.example.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.example.mapper.UserMapper;
import org.example.pojo.User;
import org.example.service.UserService;
import org.example.util.SqlSessionFactoryUtils;


import java.util.List;

public class UserServiceImpl implements UserService {
    //1. 创建SqlSessionFactory 工厂对象
    SqlSessionFactory factory = SqlSessionFactoryUtils.getSqlSessionFactory();

    @Override
    public User select(String username, String password) {
        System.out.println("select");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //4. 调用方法
        User user = mapper.select(username, password);
        //5. 释放资源
        sqlSession.close();

        return user;
    }

    @Override
    public User selectByUsername(String username) {

        System.out.println("selectByUsername");;
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取UserMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //4. 调用方法
        User user = mapper.selectByUsername(username);
        //5. 释放资源
        sqlSession.close();
        System.out.println(user);

        return user;
    }

    @Override
    public void add(User user) {
        System.out.println("add");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        System.out.println(user);
        //4. 调用方法
        try {
            mapper.add(user);
            sqlSession.commit();
            sqlSession.close();
        }
        catch(Exception e){
            e.printStackTrace();
            sqlSession.close();
        }

    }

    @Override
    public void deleteByIds(int[] ids) {
        System.out.println("deleteByIds");
        //2. 获取SqlSession对象
        SqlSession sqlSession = factory.openSession();
        //3. 获取BrandMapper
        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
        //4. 调用方法
        mapper.deleteByIds(ids);
        //5. 释放资源
        sqlSession.close();
    }


}
