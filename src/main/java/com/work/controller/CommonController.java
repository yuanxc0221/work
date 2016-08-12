package com.work.controller;

import com.github.pagehelper.PageHelper;
import com.work.model.Goods;
import com.work.service.GoodsService;
import com.work.service.Goods_typeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

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

    @RequestMapping("/paging/{pages}")
    @ResponseBody
    public List<Goods> paging(@PathVariable int pages){
        List<Goods> goods_list = new ArrayList<Goods>();
        PageHelper.startPage(pages,6);
        goods_list = goodsService.getGoodsList();
        System.out.println(goods_list + "====================== goods_list");
        return goods_list;
    }

    @RequestMapping("/indexPagers")
    @ResponseBody
    public int indexPagers(){
        int count = this.goodsService.count();
        if(count%6==0){
            return count/6;
        }else {
            return (count/6)+1;
        }
    }

    @RequestMapping("/details/{g_id}")
    @ResponseBody
    public Goods details(@PathVariable int g_id){
        Goods goods = goodsService.selectById(g_id);
        return goods;

    }

}