package org.example.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.example.pojo.User;

public interface UserMapper {


    /**
     * 根据用户名和密码查询用户对象
     *
     * @param username
     * @param password
     * @return
     */
    @Select("select * from tb_user where username = #{username} and password = #{password}")
    User select(@Param("username") String username, @Param("password") String password);

    /**
     * 根据用户名查询用户对象
     *
     * @param username
     * @return
     */
    @Select("select * from tb_user where username = #{username}")
    User selectByUsername(String username);

    /**
     * 添加用户
     *
     * @param user
     */
    @Insert("insert into tb_user(username, password, email) values(#{username},#{password}, #{email})")
    void add(User user);

    /**
     * 批量删除
     *
     * @param ids
     */
    void deleteByIds(int[] ids);
}

