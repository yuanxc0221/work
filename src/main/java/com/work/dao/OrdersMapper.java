package com.work.dao;

import com.work.model.Orders;
import com.work.util.BaseMapper;

import java.util.List;
import java.util.Map;
/**
 * Created by 林智 on 2016/8/15.
 */
public interface OrdersMapper extends BaseMapper<Orders> {
    public List<Orders> selectAllOrders(Map<String,Object> getPageBean);

    public int countAll(Map<String,Object> getPageBean);

    void updateInfo(Orders orders);     //虽然订单不能修改,但还是留个接口在这里

    List<Orders> selectBySign(int o_sign);

    void addOrders(Orders orders);

    int countOwn(Map<String, Object> parameterMap);

    List<Orders> selectOwnOrders(Map<String, Object> parameterMap);

    String findMaxSign();

    void deleteBySign(int o_sign);
}