package com.work.service.impl;

import com.work.been.PageBean;
import com.work.dao.ShoppingcartMapper;
import com.work.model.Shoppingcart;
import com.work.service.ShoppingcartService;
import com.work.util.BaseMapper;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 林智 on 2016/8/7.
 */
@Service
public class ShoppingcartServiceImpl extends BaseServiceImpl<Shoppingcart> implements ShoppingcartService {
    @Autowired
    private ShoppingcartMapper shoppingcartMapper;

    @Override
    protected BaseMapper<Shoppingcart> getBaseMapper() {
        return shoppingcartMapper;
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
        List<Shoppingcart> list  = shoppingcartMapper.selectOwnShoppingCart(parameterMap);
        int count=shoppingcartMapper.countOwn(parameterMap);
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
    public Shoppingcart selectById(int s_id) {
        return shoppingcartMapper.selectById(s_id);
    }

    @Override
    public void deleteById(int s_id) {
        shoppingcartMapper.deleteById(s_id);
    }

    @Override
    public void updateInfo(Shoppingcart shoppingcart) {
        shoppingcartMapper.updateInfo(shoppingcart);
    }

    @Override
    public void addShoppingCart(Shoppingcart shoppingcart) {
        Shoppingcart sc = isRepeat(shoppingcart);       //查询是否重复放入购物车
        if(sc != null){     //表示重复放入购物车,这时候piece加1就行
            sc.setPiece(sc.getPiece() + 1);
            System.out.println(sc.getS_id() + " =============------------");
            updateInfo(sc);
        }else {
            shoppingcartMapper.addShoppingCart(shoppingcart);   //若没有重复,则直接添加入购物车
        }
    }

    public Shoppingcart isRepeat(Shoppingcart shoppingcart){
        return shoppingcartMapper.isRepeat(shoppingcart);
    }

}
