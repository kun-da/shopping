package com.shop.shopping.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shop.shopping.dao.ReviewsDao;
import com.shop.shopping.POJO.entity.Reviews;
import com.shop.shopping.service.ReviewsService;
import org.springframework.stereotype.Service;

/**
 * (Reviews)表服务实现类
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@Service("reviewsService")
public class ReviewsServiceImpl extends ServiceImpl<ReviewsDao, Reviews> implements ReviewsService {

}

