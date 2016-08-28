package com.work.dao;

import com.work.model.User;
import com.work.util.BaseMapper;

import java.util.List;
import java.util.Map;

public interface UserMapper extends BaseMapper<User> {
    /**
     *
     * @param getPageBean 封装了排序字段。排序方式，查询值，分页值，分页页数
     * @return 查询后的集
     */
    public List<User> selectAllUser(Map<String,Object> getPageBean);

    /**
     *
     * @param getPageBean 封装了排序字段。排序方式，查询值，分页值，分页页数
     * @return 集的条数
     */
    public int countAll(Map<String,Object> getPageBean);

    void updateInfo(User user);

    User selectById(int u_id);

    void deleteById(int u_id);

    User login(User user);

    void add(User user);

    List<User> selectAllToExcel();

    int countUsername(String username);
}