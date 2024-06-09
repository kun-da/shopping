package com.shop.shopping.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shop.shopping.dao.OrdersDao;
import com.shop.shopping.POJO.entity.Orders;
import com.shop.shopping.service.OrdersService;
import org.springframework.stereotype.Service;

/**
 * (Orders)表服务实现类
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@Service("ordersService")
public class OrdersServiceImpl extends ServiceImpl<OrdersDao, Orders> implements OrdersService {

}

