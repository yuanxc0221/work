package com.work.service.impl;

import com.work.been.PageBean;
import com.work.dao.UserMapper;
import com.work.model.User;
import com.work.service.UserService;
import com.work.util.BaseMapper;
import com.work.util.Encrypt;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 黄柏樟 on 2016/6/28.
 * @Explain: 学生报名业务实现
 */
@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    private UserMapper userMapper ;
    @Override
    protected BaseMapper<User> getBaseMapper() {
        return this.userMapper;
    }

    @Override
    public Map dataTable(String searchText, int sEcho, PageBean pageBean) {
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        if (searchText != null && !searchText.trim().isEmpty()) {
            searchText = "%"+searchText+"%";
            parameterMap.put("searchText",searchText);
        } if(pageBean.getSort()!=null&& !pageBean.getSort().trim().isEmpty()){
            parameterMap.put("sort",pageBean.getSort());
            parameterMap.put("order",pageBean.getOrder());
        }
        parameterMap.put("pageOffset", pageBean.getPageOffset());
        parameterMap.put("size", pageBean.getSize());
        List<User> list  = userMapper.selectAllUser(parameterMap);
        int cout=userMapper.countAll(parameterMap);
        pageBean.init(cout,list);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords",cout);//查询结果的总条数
        map.put("aaData", list);
        return map;
    }

    @Override
    public void updateInfo(User user) {
        this.userMapper.updateInfo(user) ;
    }

    public User selectById(int u_id){
        return this.userMapper.selectById(u_id);
    }

    @Override
    public void deleteById(int u_id) {
        this.userMapper.deleteById(u_id);
    }

    @Override
    public User login(User user) {
        user.setPassword(Encrypt.e(user.getPassword()));
        return this.userMapper.login(user);
    }

    @Override
    public void
    add(User user) {
        this.userMapper.add(user);
    }

    @Override
    public List<User> selectAllToExcel() {
        return userMapper.selectAllToExcel();
    }
}
