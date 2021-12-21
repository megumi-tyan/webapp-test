package org.example.service;

import org.example.pojo.PageBean;
import org.example.pojo.Product;

public interface ProductService {

    /**
     * 分页条件查询
     * @param currentPage
     * @param pageSize
     * @param product
     * @return
     */
    PageBean<Product> selectByPageAndCondition(int currentPage, int pageSize, Product product);

    /**
     * 添加商品
     * @param product
     */
    Integer add(Product product);

    /**
     * 批量删除
     * @param ids
     */
    void deleteByIds(int[] ids);

    /**
     * 修改商品属性
     * @param product
     */
    void update(Product product);
}
