package com.shop.shopping.controller;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shop.shopping.POJO.entity.CartItems;
import com.shop.shopping.service.CartItemsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.io.Serializable;
import java.util.List;

/**
 * (CartItems)表控制层
 *
 * @author makejava
 * @since 2024-06-09 20:44:10
 */
@RestController
@RequestMapping("cartItems")
public class CartItemsController extends ApiController {
    /**
     * 服务对象
     */
    @Autowired
    private CartItemsService cartItemsService;

    /**
     * 分页查询所有数据
     *
     * @param page 分页对象
     * @param cartItems 查询实体
     * @return 所有数据
     */
    @GetMapping
    public R selectAll(Page<CartItems> page, CartItems cartItems) {
        return success(this.cartItemsService.page(page, new QueryWrapper<>(cartItems)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Serializable id) {
        return success(this.cartItemsService.getById(id));
    }

    /**
     * 新增数据
     *
     * @param cartItems 实体对象
     * @return 新增结果
     */
    @PostMapping
    public R insert(@RequestBody CartItems cartItems) {
        return success(this.cartItemsService.save(cartItems));
    }

    /**
     * 修改数据
     *
     * @param cartItems 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R update(@RequestBody CartItems cartItems) {
        return success(this.cartItemsService.updateById(cartItems));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("idList") List<Long> idList) {
        return success(this.cartItemsService.removeByIds(idList));
    }
}

