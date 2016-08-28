package com.work.service;

import com.work.been.PageBean;
import com.work.model.User;

import java.util.List;
import java.util.Map;

/**
 * Created by 黄柏樟 on 2016/6/28.
 * @Explain: 学生报名业务接口
 */
public interface UserService extends BaseService<User> {
    Map dataTable(String searchText, int sEcho, PageBean pageBean);

    void updateInfo(User user);

    User selectById(int u_id);

    void deleteById(int u_id);

    User login(User user);

    void add(User user);

    List<User> selectAllToExcel();

    int countUsername(String username);
}
