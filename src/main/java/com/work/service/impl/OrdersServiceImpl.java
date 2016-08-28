package com.work.service.impl;

import com.work.been.PageBean;
import com.work.dao.OrdersMapper;
import com.work.model.Orders;
import com.work.service.OrdersService;
import com.work.util.BaseMapper;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 林智 on 2016/8/15.
 */
@Service
public class OrdersServiceImpl extends BaseServiceImpl<Orders> implements OrdersService {
    @Autowired
    private OrdersMapper ordersMapper;

    @Override
    protected BaseMapper<Orders> getBaseMapper() {
        return ordersMapper;
    }

    @Override
    public Map dataTable(String searchText, int sEcho, PageBean pageBean, int u_id) {
        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("u_id",u_id);
        if (searchText != null && !searchText.trim().isEmpty()) {
            searchText = "%"+searchText+"%";
            parameterMap.put("searchText",searchText);
        } if(pageBean.getSort()!=null&& !pageBean.getSort().trim().isEmpty()){
            parameterMap.put("sort",pageBean.getSort());
            parameterMap.put("order",pageBean.getOrder());
        }
        parameterMap.put("pageOffset", pageBean.getPageOffset());
        parameterMap.put("size", pageBean.getSize());
        List<Orders> list  = ordersMapper.selectOwnOrders(parameterMap);
        int count=ordersMapper.countOwn(parameterMap);
        pageBean.init(count,list);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords",count);//查询结果的总条数
        map.put("aaData", list);
        System.out.println(map);
        return map;
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
        List<Orders> list  = ordersMapper.selectAllOrders(parameterMap);
        int count=ordersMapper.countAll(parameterMap);
        pageBean.init(count,list);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords",count);//查询结果的总条数
        map.put("aaData", list);
        System.out.println(map);
        return map;
    }

    @Override
    public List<Orders> selectBySign(int o_sign) {
        return ordersMapper.selectBySign(o_sign);
    }

    @Override
    public void updateInfo(Orders orders) {
        ordersMapper.updateInfo(orders);
    }

    @Override
    public void addOrders(Orders orders) {
        ordersMapper.addOrders(orders);   //若没有重复,则直接添加入购物车
    }

    @Override
    public String findMaxSign() {
        return ordersMapper.findMaxSign();
    }

    @Override
    public void deleteBySign(int o_sign) {
        ordersMapper.deleteBySign(o_sign);
    }

}
