package com.shop.shopping.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shop.shopping.dao.CouponsDao;
import com.shop.shopping.POJO.entity.Coupons;
import com.shop.shopping.service.CouponsService;
import org.springframework.stereotype.Service;

/**
 * (Coupons)表服务实现类
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@Service("couponsService")
public class CouponsServiceImpl extends ServiceImpl<CouponsDao, Coupons> implements CouponsService {

}

