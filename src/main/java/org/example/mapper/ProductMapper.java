package org.example.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.example.pojo.Product;

import java.util.List;

public interface ProductMapper {

    /**
     * 分页条件查询
     * @param begin
     * @param size
     * @return
     */
    List<Product> selectByPageAndCondition(@Param("begin") int begin, @Param("size") int size, @Param("product") Product product);

    /**
     * 根据条件查询总记录数
     * @return
     */
    int selectTotalCountByCondition(Product product);

    /**
     * 添加商品
     * @param product
     */
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    @Insert("insert into tb_product(name, price, description, status) values (#{name}, #{price}, #{description}, #{status})")
    Integer add(Product product);

    /**
     * 批量删除
     * @param ids
     */
    void deleteByIds(@Param("ids") int[] ids);

    /**
     * 修改商品属性
     * @param product
     */
    @Update("UPDATE tb_product SET name = #{name}, price = #{price}, description = #{description}, status = #{status} WHERE id = #{id}")
    void update(Product product);
}
