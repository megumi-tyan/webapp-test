package org.example.service;

import org.apache.ibatis.annotations.Param;
import org.example.pojo.Analysis;
import org.example.pojo.OrderView;
import org.example.pojo.PageBean;
import org.example.pojo.Product;

import java.util.List;

public interface OrderService {

    /**
     * 分页条件查询
     */
    PageBean<OrderView> selectByPageAndCondition(int currentPage, int pageSize, String username);

    PageBean<OrderView> selectByPageAndMultiCondition(int currentPage, int pageSize, OrderView orderView);

    Analysis selectByMultiCondition(OrderView orderView);

    void add(Integer userId, Integer productId, String address);


//    void deleteByIds(int[] ids);
}
