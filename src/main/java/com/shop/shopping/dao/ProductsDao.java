package com.shop.shopping.dao;

import java.util.List;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import com.shop.shopping.POJO.entity.Products;

/**
 * (Products)表数据库访问层
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
public interface ProductsDao extends BaseMapper<Products> {

/**
* 批量新增数据（MyBatis原生foreach方法）
*
* @param entities List<Products> 实例对象列表
* @return 影响行数
*/
int insertBatch(@Param("entities") List<Products> entities);

/**
* 批量新增或按主键更新数据（MyBatis原生foreach方法）
*
* @param entities List<Products> 实例对象列表
* @return 影响行数
* @throws org.springframework.jdbc.BadSqlGrammarException 入参是空List的时候会抛SQL语句错误的异常，请自行校验入参
*/
int insertOrUpdateBatch(@Param("entities") List<Products> entities);

}

