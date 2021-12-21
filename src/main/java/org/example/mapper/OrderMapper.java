package org.example.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.example.pojo.OrderView;
import org.example.pojo.Product;
import org.example.pojo.User;

import java.util.List;

public interface OrderMapper {

    /**
     * 根据用户条件查询
     *
     * @param begin
     * @param size
     * @param username
     * @return
     */
    List<OrderView> selectByPageAndCondition(@Param("begin") int begin, @Param("size") int size, @Param("username") String username);

    /**
     * 根据用户条件查询总记录数
     *
     * @return
     */
    int selectTotalCountByCondition(String username);

    /**
     * 分页看所有订单
     * @param begin
     * @param size
     * @param orderView
     * @return
     */
    List<OrderView> selectByPageAndMultiCondition(@Param("begin") int begin, @Param("size") int size, @Param("orderView") OrderView orderView);

    /**
     * 查看所有订单的数量
     * @param orderView
     * @return
     */
    int selectTotalCountByMultiCondition(@Param("orderView") OrderView orderView);

    /**
     * 查看所有订单
     * @param orderView
     * @return
     */
    List<OrderView> selectByMultiCondition(@Param("orderView") OrderView orderView);

    /**
     * 添加订单
     * @param userId
     * @param productId
     * @param time
     * @param address
     */
    @Insert("insert into tb_order(userId, productId, time, address) values(#{userId},#{productId},#{time},#{address})")
    void add(@Param("userId") Integer userId, @Param("productId") Integer productId, @Param("time") String time, @Param("address") String address);


}

