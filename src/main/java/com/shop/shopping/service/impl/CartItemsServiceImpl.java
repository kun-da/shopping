package com.shop.shopping.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shop.shopping.dao.CartItemsDao;
import com.shop.shopping.POJO.entity.CartItems;
import com.shop.shopping.service.CartItemsService;
import org.springframework.stereotype.Service;

/**
 * (CartItems)表服务实现类
 *
 * @author makejava
 * @since 2024-06-09 20:44:13
 */
@Service("cartItemsService")
public class CartItemsServiceImpl extends ServiceImpl<CartItemsDao, CartItems> implements CartItemsService {

}

