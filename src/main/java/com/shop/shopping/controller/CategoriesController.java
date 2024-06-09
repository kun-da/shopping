package com.shop.shopping.controller;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.api.ApiController;
import com.baomidou.mybatisplus.extension.api.R;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shop.shopping.POJO.entity.Categories;
import com.shop.shopping.service.CategoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.io.Serializable;
import java.util.List;

/**
 * (Categories)表控制层
 *
 * @author makejava
 * @since 2024-06-09 20:44:14
 */
@RestController
@RequestMapping("categories")
public class CategoriesController extends ApiController {
    /**
     * 服务对象
     */
    @Autowired
    private CategoriesService categoriesService;

    /**
     * 分页查询所有数据
     *
     * @param page 分页对象
     * @param categories 查询实体
     * @return 所有数据
     */
    @GetMapping
    public R selectAll(Page<Categories> page, Categories categories) {
        return success(this.categoriesService.page(page, new QueryWrapper<>(categories)));
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("{id}")
    public R selectOne(@PathVariable Serializable id) {
        return success(this.categoriesService.getById(id));
    }

    /**
     * 新增数据
     *
     * @param categories 实体对象
     * @return 新增结果
     */
    @PostMapping
    public R insert(@RequestBody Categories categories) {
        return success(this.categoriesService.save(categories));
    }

    /**
     * 修改数据
     *
     * @param categories 实体对象
     * @return 修改结果
     */
    @PutMapping
    public R update(@RequestBody Categories categories) {
        return success(this.categoriesService.updateById(categories));
    }

    /**
     * 删除数据
     *
     * @param idList 主键结合
     * @return 删除结果
     */
    @DeleteMapping
    public R delete(@RequestParam("idList") List<Long> idList) {
        return success(this.categoriesService.removeByIds(idList));
    }
}

