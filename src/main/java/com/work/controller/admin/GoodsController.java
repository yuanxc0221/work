package com.work.controller.admin;

import com.work.been.AjaxResult;
import com.work.been.PageBean;
import com.work.model.Goods;
import com.work.service.GoodsService;
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
 * Created by 林智 on 2016/8/7.
 */
@Controller
@RequestMapping(value = "admin/goods")
public class GoodsController extends BaseAdminController<Goods,Long>{
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private Goods_typeService goods_typeService;

    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH + "list";
    }

    @RequestMapping("dataTable")
    @ResponseBody
    public Map dataTable(String searchText, int sEcho, PageBean pageBean){
        return goodsService.dataTable(searchText,sEcho,pageBean);
    }

    @RequestMapping("update")
    public String update(Goods goods, RedirectAttributes redirectAttributes){
        try {
            goodsService.updateInfo(goods);
            redirectAttributes.addFlashAttribute("msg",RESULT_OK);
            return REDIRECT_URL+"list";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_ERROR);
        return REDIRECT_URL+"list";
    }

    @RequestMapping(value = "/saveUI", method = RequestMethod.GET)
    public String saveUI(Model model){
        model.addAttribute("goods_type_list", goods_typeService.selectAll());
        return TEMPLATE_PATH+"saveUI";
    }

    @RequestMapping("saveUI/{gt_id}")
    public String saveUI(@PathVariable int gt_id, Model model){
        model.addAttribute("goods",goodsService.selectById(gt_id));
        model.addAttribute("goods_type_list", goods_typeService.selectAll());
        return TEMPLATE_PATH+"saveUI";
    }


    @RequestMapping("delete/{gt_id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable int gt_id){
        try {
            //   majorService.deleteByDepartId(gt_id);
            goodsService.deleteById(gt_id);
            return successResult;
        }catch (Exception e){
            e.printStackTrace();
            return errorResult;
        }
    }

    @RequestMapping("show/{gt_id}")
    public String show(@PathVariable int gt_id,Model model){
        model.addAttribute("goods",goodsService.selectById(gt_id));
        return TEMPLATE_PATH+"show";
    }

    @RequestMapping("add")
    public String add(Goods goods,RedirectAttributes redirectAttributes){
        try {
            goodsService.addGoods(goods);
            redirectAttributes.addFlashAttribute("msg", RESULT_OK);
            return REDIRECT_URL + "list";
        }catch (Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_ERROR);
        return REDIRECT_URL+"list";
    }
}
