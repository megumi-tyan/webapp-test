package org.example.service;

import org.apache.ibatis.annotations.Select;
import org.example.pojo.User;

import java.util.List;

public interface UserService {

    /**
     * 查询所有
     * @return
     */
    User select(String username, String password);

    /**
     * 根据用户名查找
     * @param username
     * @return
     */
    User selectByUsername(String username);

    /**
     * 添加数据
     * @param user
     */
    void add(User user);


    /**
     * 批量删除
     * @param ids
     */
    void deleteByIds( int[] ids);



}
