package com.work.controller.user;

import com.work.been.AjaxResult;
import com.work.been.PageBean;
import com.work.model.Orders;
import com.work.model.Shoppingcart;
import com.work.model.User;
import com.work.service.OrdersService;
import com.work.service.ShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 林智 on 2016/8/15.
 */
@Controller
@RequestMapping("user/orders")
public class UOrdersController extends BaseUserController<Orders, String> {
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
        User user = (User) session.getAttribute("loginUser");
        int u_id = user.getU_id();
        return ordersService.dataTable(searchText,sEcho,pageBean,u_id);
    }


    @RequestMapping(value = "add")
    public String add(String remark, HttpSession session,RedirectAttributes redirectAttributes){
        try {
            int integrate = 0;      //主订单标识,由于是几个订单拼凑成为一个订单, 所以将第一个订单定义为主订单以方便订单的显示
            int sign = 1;           //订单标识
            if(ordersService.findMaxSign() != null){
                sign = Integer.parseInt(ordersService.findMaxSign());
                sign++;
                integrate = sign;
            }

            User user = (User) session.getAttribute("loginUser");
            int u_id = user.getU_id();
            List<Shoppingcart> shoppingcartsList = shoppingcartService.selectByUserId(u_id);
            Orders orders = new Orders();
            for(Shoppingcart s : shoppingcartsList){
                orders.setUser_id(s.getUser_id());
                orders.setPiece(s.getPiece());
                orders.setGoods_id(s.getGoods_id());
                orders.setO_time(new Date());
                orders.setRemark(remark);
                orders.setO_sign(sign);
                orders.setO_integrate(integrate);
                integrate = 0;
                ordersService.addOrders(orders);
            }
            shoppingcartService.deleteByUserId(u_id);

            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "添加成功"));
            return "redirect:/user/orders/list";
        }catch(Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_ERROR);
        return "redirect:/registerUI";
    }

    @RequestMapping(value = "/saveUI", method = RequestMethod.GET)
    public String saveUI(Model model,HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        int u_id = user.getU_id();
        List<Shoppingcart> shoppingcartList = shoppingcartService.selectByUserId(u_id);
        double count = 0;
        for(Shoppingcart s: shoppingcartList){
            count += s.getPiece() * s.getGoods().getMoney();
        }
        model.addAttribute("count",count);      //count表示订单的总金额
        model.addAttribute("ShoppingCartList", shoppingcartList);
        System.out.println(shoppingcartList + "---------------");
        return TEMPLATE_PATH+"saveUI";
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
            return successResult;
        }catch (Exception e){
            e.printStackTrace();
            return errorResult;
        }
    }
}
