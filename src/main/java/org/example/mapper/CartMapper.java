package org.example.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.example.pojo.OrderView;

import java.util.List;

public interface CartMapper {
    /**
     * 用户使用的查询语句
     *
     * @param begin
     * @param size
     * @param username
     * @return
     */
    List<OrderView> selectByPageAndCondition(@Param("begin") int begin, @Param("size") int size, @Param("username") String username);

    /**
     * 根据条件查询总记录数
     *
     * @return
     */
    int selectTotalCountByCondition(String username);

    /**
     * 添加购物车
     * @param userId
     * @param productId
     * @param time
     */
    @Insert("insert into tb_cart(userId, productId, time) values(#{userId},#{productId},#{time})")
    void add(@Param("userId") Integer userId, @Param("productId") Integer productId, @Param("time") String time);

    void deleteByIds(@Param("ids")int[] ids);
}
