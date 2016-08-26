package com.work.controller.user;

import com.work.been.AjaxResult;
import com.work.been.PageBean;
import com.work.model.Shoppingcart;
import com.work.model.User;
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
import java.util.Map;

/**
 * Created by 林智 on 2016/8/13.
 */
@Controller
@RequestMapping("user/ShoppingCart")
public class UShoppingcartController extends BaseUserController<Shoppingcart, String>{
    @Autowired
    private ShoppingcartService shoppingcartService;

    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }

    @RequestMapping("dataTable")
    @ResponseBody
    public Map dataTable(String searchText, int sEcho, PageBean pageBean, HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        int u_id = user.getU_id();
        return shoppingcartService.dataTable(searchText, sEcho, pageBean, u_id);
    }

    @RequestMapping("delete/{s_id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable int s_id){
        try {
            shoppingcartService.deleteById(s_id);
            return new AjaxResult(true,"操作成功");
        }catch (Exception e){
            e.printStackTrace();
            return new AjaxResult(false,"操作失败");
        }
    }

    @RequestMapping("saveUI/{s_id}")
    public String saveUI(@PathVariable int s_id, Model model){
        model.addAttribute("shoppingcart",shoppingcartService.selectById(s_id));
        return TEMPLATE_PATH+"saveUI";
    }

    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    public String update(Shoppingcart shoppingcart , RedirectAttributes redirectAttributes){
        this.shoppingcartService.updateInfo(shoppingcart) ;
        redirectAttributes.addFlashAttribute("result", successResult);
        return "redirect:/user/ShoppingCart/list";
    }
}
