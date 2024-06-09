package com.shop.shopping.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shop.shopping.dao.OrderItemsDao;
import com.shop.shopping.POJO.entity.OrderItems;
import com.shop.shopping.service.OrderItemsService;
import org.springframework.stereotype.Service;

/**
 * (OrderItems)表服务实现类
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@Service("orderItemsService")
public class OrderItemsServiceImpl extends ServiceImpl<OrderItemsDao, OrderItems> implements OrderItemsService {

}

