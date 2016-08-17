package com.work.service;

import com.work.been.PageBean;
import com.work.model.Orders;

import java.util.List;
import java.util.Map;

/**
 * Created by 林智 on 2016/8/15.
 */
public interface OrdersService extends BaseService<Orders>{

    Map dataTable(String searchText, int sEcho, PageBean pageBean, int u_id);

    List<Orders> selectBySign(int o_sign);

    void deleteBySign(int o_sign);

    void updateInfo(Orders orders);

    void addOrders(Orders orders);

    String findMaxSign();


}
