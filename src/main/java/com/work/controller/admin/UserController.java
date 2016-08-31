package com.work.controller.admin;

import com.work.been.AjaxResult;
import com.work.been.PageBean;
import com.work.model.User;
import com.work.service.UserService;
import com.work.util.Encrypt;
import com.work.util.ExcelUtil;
import com.work.util.FileUploadUtil;
import com.work.util.ReadExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("admin/user")
public class UserController extends BaseAdminController<User, String>{
    @Autowired
    private UserService userService ;

    @RequestMapping(value = "add" ,method = RequestMethod.POST)     // 由于未知原因传入 user 对象会报400, 所以只好改用传入属性再封装的方式来解决这个问题, 这也是我暂时所能想到的解决方法..
    public String add(String name ,String username, String phone, String address, String email,
                      String introduction , RedirectAttributes redirectAttributes){
        try {
            User user = new User();
            user.setEmail(email);
            user.setIntroduction(introduction);
            user.setAddress(address);
            user.setName(name);
            user.setPhone(phone);
            user.setUsername(username);
            user.setPassword(Encrypt.e("123456"));       // md5加密
            user.setDate(new Date());
            this.userService.add(user) ;
          //  redirectAttributes.addAttribute("msg",RESULT_OK);
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "注册成功"));
            return REDIRECT_URL+"list";
        }catch(Exception e){
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("msg", RESULT_ERROR);
        return REDIRECT_URL+"list";
    }

    /**
     * 异步删除
     * @param u_id
     * @return
     */
    @RequestMapping(value = "/delete/{u_id}", method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult delete(@PathVariable int u_id) {
        try {
            this.userService.deleteById(u_id);
            return successResult;
        }catch(Exception e){
            e.printStackTrace();
        }
        return errorResult;
    }
    @RequestMapping("list")
    public String list(){
        return TEMPLATE_PATH+"list";
    }
    /**
     * 异步获取dataTable
     * @param searchText
     * @param sEcho
     * @param pageBean
     * @return
     */
    @RequestMapping("dataTable")
    @ResponseBody
    public Map dataTable(String searchText, int sEcho, PageBean pageBean) {
        return userService.dataTable(searchText, sEcho, pageBean);
    }

    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    public String update(User user , RedirectAttributes redirectAttributes){
        this.userService.updateInfo(user) ;
        redirectAttributes.addFlashAttribute("result", successResult);
        return REDIRECT_URL+"list";
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

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.removeAttribute("loginUser");
        return "index";
    }

    /**
     * 导出Excel的方法
     * */
    @RequestMapping(value = "excel")
    @ResponseBody
    public boolean excel(){
        List<User> userList = userService.selectAllToExcel();
        ExcelUtil<User> u = new ExcelUtil<User>();
        String[] headers = { "用户名", "姓名", "性别", "手机号", "邮箱", "地址",
                "个人说明", "创建时间"};
        String[] fields = { "username", "name",
                "sex", "phone", "email",
                "address", "introduction", "date"};
        OutputStream out = null;
        // HttpServletResponse response = ServletActionContext.getResponse();
        // response.setContentType("application/msexcel;charset=UTF-8");
        Date myDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String time = sdf.format(new Date());       //效果为  文件名+time
        /*int time = myDate.getMonth() + 1;*/
        // response.setHeader("Content-disposition","attachment; filename="+time+"Mouth_excel_gdzcheck.xls");
        try {
            File desktopDir = FileSystemView.getFileSystemView()      //获取桌面路径
                    .getHomeDirectory();
            String desktopPath = desktopDir.getAbsolutePath();        //获取桌面路径
            String title = "用户信息导出表" + time ;
            //String name = File.separator + time + "Mouth.xls";
            File file = new File(desktopPath + File.separator+"用户信息"+File.separator+"用户信息导出表" + time + ".xls");
            // out = response.getOutputStream();
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            file.createNewFile();
            out = new FileOutputStream(file);

            u.exportExcel(title, headers, fields, userList, out, "yyyy-MM-dd");
            /* 测试通过-----返回list
             * ReadExcel readExcel=new ReadExcel();
            List<User> list=readExcel.readExcel(name);
            if (list!=null) {
                for (User tasksVo :list) {
                    System.out.println("taskTransmitterName:"+tasksVo.getTaskTransmitterName());
                }
            }*/
            // response.reset();//清空输出流
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException ex) {
                }
            }
        }
    }

    /**
     * 导入Excel的方法
     * */
    @RequestMapping(value = "readExcel")
    public String readExcel(@RequestParam(value = "excel", required = true) MultipartFile excel, HttpServletRequest request, RedirectAttributes redirectAttributes){
        String path = "/resources/file/user/excel";
        String fileName = FileUploadUtil.uploadFile(excel,path);
        //System.out.println(fileName + " fileName =============================== ");
        String suffix = fileName.substring(36, 40);
        //System.out.println(suffix + " =============================== ");
        if(!".xls".equals(suffix) && !".xlsx".equals(suffix)){
            //System.out.println("!\".xls\".equals(suffix) : " + !".xls".equals(suffix));
            //System.out.println("!\".xlsx\".equals(suffix) : " + !".xlsx".equals(suffix));
            redirectAttributes.addFlashAttribute("result", new AjaxResult(false, "导入失败,表的格式必须为 .xls 或 .xlsx"));
            return REDIRECT_URL+"list";
        }
        String savePath = request.getSession().getServletContext().getRealPath("/resources/file/user/excel/"+fileName);//测试所得为真实路径
       // System.out.println(savePath + "============---------------");     //测试所得为真实路径
        List<String> list = null;
        int sign = 0;   //用于标记是否读取了属性名那行(也就是第一行,第一行是不需要的)
        int successNumber = 0;
        User user = new User();
        try {
            list = ReadExcel.exportListFromExcel(new File(savePath), 0);
            for(String s: list){
              //  System.out.println(s + "==========");    //测试方便用
                sign++;  //当sign大于1时,表示第一行已经遍历过了,此后可以继续遍历读取属性到相应对象中
                String[] names = s.split("\\|");
                if(sign > 1){
                    /*for (int i = 1; i < 8; i++) {   //不能从 0 开始,由于分割的作用,导致了第一个位置会是空格,所以得从 1 开始才是读取真正的数据
                        System.out.println(names[i] + "---- ");        //测试用
                    }*/
                    user.setUsername(names[1]);
                    user.setName(names[2]);
                    user.setSex(names[3]);
                    user.setPhone(names[4]);
                    user.setEmail(names[5]);
                    user.setAddress(names[6]);
                    user.setIntroduction(names[7]);
                    user.setDate(new Date());
                    user.setPassword(Encrypt.e("123456"));   //从excel导入的用户密码均设为123456
                    if(userService.countUsername(user.getUsername()) == 0){ //若已存在相同的登录名的用户,则不执行添加操作,也不提供修改信息的操作..
                        userService.add(user);
                        successNumber++;
                    }
                }
            }
            FileUploadUtil.deleteFile(path,fileName);   //excel里的内容导入数据库后就可以将excel删除了
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "成功导入用户信息表,成功"+ successNumber +"次,失败" + (sign-successNumber-1) + "次"));
            System.out.println(list);
        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("result", new AjaxResult(true, "导入失败,请确认表的格式是否为 .xls 或 .xlsx"));
        }
        return REDIRECT_URL+"list";
    }

}
