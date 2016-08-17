package com.work.dao;

import com.work.model.Shoppingcart;
import com.work.util.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * Created by 林智 on 2016/8/12.
 */
public interface ShoppingcartMapper extends BaseMapper<Shoppingcart> {
    public List<Shoppingcart> selectAllShoppingCart(Map<String,Object> getPageBean);

    public int countAll(Map<String,Object> getPageBean);

    void updateInfo(Shoppingcart shoppingcart);

    Shoppingcart selectById(int s_id);

    void deleteById(int s_id);

    void addShoppingCart(Shoppingcart shoppingcart);

    Shoppingcart isRepeat(Shoppingcart shoppingcart);

    int countOwn(Map<String, Object> parameterMap);

    List<Shoppingcart> selectOwnShoppingCart(Map<String, Object> parameterMap);

    List<Shoppingcart> selectByUserId(int u_id);

    void deleteByUserId(int u_id);
}
