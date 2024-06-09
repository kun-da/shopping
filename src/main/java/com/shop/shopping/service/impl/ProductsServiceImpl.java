package com.shop.shopping.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shop.shopping.dao.ProductsDao;
import com.shop.shopping.POJO.entity.Products;
import com.shop.shopping.service.ProductsService;
import org.springframework.stereotype.Service;

/**
 * (Products)表服务实现类
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@Service("productsService")
public class ProductsServiceImpl extends ServiceImpl<ProductsDao, Products> implements ProductsService {

}

