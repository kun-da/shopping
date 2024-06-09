package com.shop.shopping.controller.admin;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shop.shopping.POJO.entity.Products;
import com.shop.shopping.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.io.Serializable;
import java.util.List;

/**
 * (Products)表控制层
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@RestController
@RequestMapping("products")
public class ProductsController extends ApiController {
    /**
     * 服务对象
     */
    @Autowired
    private ProductsService productsService;

    /**
     * 分页查询所有数据
     *
     * @param page 分页对象
     * @param products 查询实体
     * @return 所有数据
     */
    @GetMapping
    public R selectAll(Page<Products> page, Products products) {
        return success(this.productsService.page(page, new QueryWrapper<>(products)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Serializable id) {
        return success(this.productsService.getById(id));
    }

    /**
     * 新增数据
     *
     * @param products 实体对象
     * @return 新增结果
     */
    @PostMapping
    public R insert(@RequestBody Products products) {
        return success(this.productsService.save(products));
    }

    /**
     * 修改数据
     *
     * @param products 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R update(@RequestBody Products products) {
        return success(this.productsService.updateById(products));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("idList") List<Long> idList) {
        return success(this.productsService.removeByIds(idList));
    }
}

