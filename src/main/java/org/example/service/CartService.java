package org.example.service;

import org.example.pojo.OrderView;
import org.example.pojo.PageBean;

public interface CartService {

    /**
     * 分页条件查询
     * @param currentPage
     * @param pageSize
     * @param username
     * @return
     */
    PageBean<OrderView> selectByPageAndCondition(int currentPage, int pageSize, String username);

    /**
     * 添加购物车
     * @param userId
     * @param productId
     */
    void add(Integer userId, Integer productId);

    /**
     * 批量删除
     * @param ids
     */
    void deleteByIds(int[] ids);

}
