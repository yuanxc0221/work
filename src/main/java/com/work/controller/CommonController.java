package com.work.controller;

import com.work.service.GoodsService;
import com.work.service.Goods_typeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 黄柏樟 on 2016/3/8.
 * @Explain: 公共视图控制器
 */
@Controller
@RequestMapping(value = "/")
public class CommonController {
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private Goods_typeService goods_typeService;

    /**
     * 首页
     * 
     * @return
     */
    @RequestMapping("/")
    public String index() {
        System.out.println("......!!!!!!");
        return "index";
    }

}