package com.work.controller.user;

import com.work.been.AjaxResult;
import com.work.model.User;
import com.work.service.UserService;
import com.work.util.Encrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;


@Controller
@RequestMapping("user/user")
public class UUserController extends BaseUserController<User, String>{
    @Autowired
    private UserService userService ;

    @RequestMapping(value = "add" ,method = RequestMethod.POST)
    public String add(@Valid @ModelAttribute("user")User user , BindingResult result, RedirectAttributes redirectAttributes, HttpServletRequest request){
        try {
            if(result.hasErrors()){
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "填写格式错误,注册失败"));
                return "redirect:/registerUI";
            }
            if(userService.countUsername(user.getUsername()) > 0){
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false,"该登录名已被注册,请换一个登录名"));
                return "redirect:/registerUI";
            }
            user.setPassword(Encrypt.e(user.getPassword()));       // md5加密
            user.setDate(new Date());
            this.userService.add(user) ;
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "注册成功"));
            return "redirect:/loginUI";
        }catch(Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "注册失败"));
        return "redirect:/registerUI";
    }

    @RequestMapping(value = "login" ,method = RequestMethod.POST)
    public String login(User user , HttpSession session, RedirectAttributes redirectAttributes){
        try {
            User loginUser=this.userService.login(user);
            if (loginUser!=null){
                session.setAttribute("loginUser",loginUser);
                redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "登录成功"));
                return "redirect:/index";
            }else {
                redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "用户名或者密码错误"));
                return "redirect:/loginUI";
            }
        }catch (Exception e){
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "发生错误"));
            return "redirect:/loginUI";
        }
    }

    /**
     * 新增页
     * @return
     */
    @RequestMapping(value = "/saveUI", method = RequestMethod.GET)
    public String saveUI() {
        return TEMPLATE_PATH + "saveUI";
    }

    @RequestMapping("saveUI/{u_id}")
    public String saveUI(@PathVariable int u_id, Model model){
        model.addAttribute(this.userService.selectById(u_id));      //未知原因,查不出id...
        model.addAttribute("u_id",u_id);
        return TEMPLATE_PATH + "saveUI";
    }

    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }

    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    public String update(User user , RedirectAttributes redirectAttributes){
        this.userService.updateInfo(user) ;
        redirectAttributes.addFlashAttribute("result", successResult);
        return "redirect:/user/ShoppingCart/list";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.removeAttribute("loginUser");
        redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "注销成功"));
        return "redirect:/index";
    }
}
