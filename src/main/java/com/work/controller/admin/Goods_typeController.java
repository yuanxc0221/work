package com.work.controller.admin;

import com.work.been.AjaxResult;
import com.work.been.PageBean;
import com.work.model.Goods_type;
import com.work.service.Goods_typeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

/**
 * Created by 林智 on 2016/8/6.
 */
@Controller
@RequestMapping(value = "admin/goods_type")
public class Goods_typeController extends BaseAdminController<Goods_type,Long>{

    @Autowired
    private Goods_typeService goods_typeService;

    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH + "list";
    }

    @RequestMapping("dataTable")
    @ResponseBody
    public Map dataTable(String searchText, int sEcho, PageBean pageBean){
        return goods_typeService.dataTable(searchText,sEcho,pageBean);
    }

    @RequestMapping("update")
    public String update(Goods_type goods_type, RedirectAttributes redirectAttributes){
        try {
            goods_typeService.updateInfo(goods_type);
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "操作成功"));
            return REDIRECT_URL+"list";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "操作失败"));
        return REDIRECT_URL+"list";
    }

    @RequestMapping(value = "/saveUI", method = RequestMethod.GET)
    public String saveUI(){
        return TEMPLATE_PATH+"saveUI";
    }

    @RequestMapping("saveUI/{gt_id}")
    public String saveUI(@PathVariable int gt_id, Model model){
        model.addAttribute("goods_type",goods_typeService.selectById(gt_id));
        System.out.println(goods_typeService.selectById(gt_id));
        return TEMPLATE_PATH+"saveUI";
    }


    @RequestMapping("delete/{gt_id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable int gt_id){
        try {
            goods_typeService.deleteById(gt_id);
            return new AjaxResult(true,"操作成功");
        }catch (Exception e){
            e.printStackTrace();
            return new AjaxResult(false,"操作失败");
        }
    }

    @RequestMapping("show/{gt_id}")
    public String show(@PathVariable int gt_id,Model model){
        model.addAttribute("goods_type",goods_typeService.selectById(gt_id));
        return TEMPLATE_PATH+"show";
    }

    @RequestMapping("add")
    public String add(Goods_type goods_type,RedirectAttributes redirectAttributes){
        try {
            goods_typeService.addGoods_type(goods_type);
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "操作成功"));
            return REDIRECT_URL + "list";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "操作失败"));
        return REDIRECT_URL+"list";
    }
}
