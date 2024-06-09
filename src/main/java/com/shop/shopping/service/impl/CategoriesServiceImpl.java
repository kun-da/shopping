package com.shop.shopping.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shop.shopping.dao.CategoriesDao;
import com.shop.shopping.POJO.entity.Categories;
import com.shop.shopping.service.CategoriesService;
import org.springframework.stereotype.Service;

/**
 * (Categories)表服务实现类
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@Service("categoriesService")
public class CategoriesServiceImpl extends ServiceImpl<CategoriesDao, Categories> implements CategoriesService {

}

