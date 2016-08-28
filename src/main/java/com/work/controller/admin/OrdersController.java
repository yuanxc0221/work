package com.work.controller.admin;

import com.work.been.AjaxResult;
import com.work.been.PageBean;
import com.work.model.Orders;
import com.work.service.OrdersService;
import com.work.service.ShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by 林智 on 2016/8/26.
 */
@Controller
@RequestMapping("admin/orders")
public class OrdersController extends BaseAdminController<Orders, String> {
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private ShoppingcartService shoppingcartService;

    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }

    @RequestMapping("dataTable")
    @ResponseBody
    public Map dataTable(String searchText, int sEcho, PageBean pageBean, HttpSession session){
        return ordersService.dataTable(searchText,sEcho,pageBean);
    }

    @RequestMapping("saveUI/{o_sign}")
    public String saveUI(@PathVariable int o_sign, Model model){
        List<Orders> ordersList = ordersService.selectBySign(o_sign);
        double count = 0;
        for(Orders o: ordersList){
            count += o.getPiece() * o.getGoods().getMoney();
        }
        model.addAttribute("count",count);
        model.addAttribute("ShoppingCartList",ordersList);
        return TEMPLATE_PATH+"saveUI";
    }

    @RequestMapping("delete/{o_sign}")
    @ResponseBody
    public AjaxResult delete(@PathVariable int o_sign){
        try {
            ordersService.deleteBySign(o_sign);
            return new AjaxResult(true,"操作成功");
        }catch (Exception e){
            e.printStackTrace();
            return new AjaxResult(false,"操作失败");
        }
    }
}
