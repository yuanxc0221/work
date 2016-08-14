package com.work.controller;

import com.github.pagehelper.PageHelper;
import com.work.model.Goods;
import com.work.model.Shoppingcart;
import com.work.model.User;
import com.work.service.GoodsService;
import com.work.service.Goods_typeService;
import com.work.service.ShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
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
    @Autowired
    private ShoppingcartService shoppingcartService;
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

    @RequestMapping("/addToShoppingCart/{g_id}")
    @ResponseBody
    public boolean addToShoppingCart(@PathVariable int g_id, HttpSession session){
        User user = (User) session.getAttribute("loginUser");
        if(user != null){
            int u_id = user.getU_id();
            Shoppingcart sc = new Shoppingcart();
            sc.setGoods_id(g_id);
            sc.setPiece(1);
            sc.setS_time(new Date());
            sc.setUser_id(u_id);
            shoppingcartService.addShoppingCart(sc);
            return true;
        }
        return false;
    }

}