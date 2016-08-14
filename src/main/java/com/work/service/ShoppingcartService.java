package com.work.service;

import com.work.been.PageBean;
import com.work.model.Shoppingcart;

import java.util.Map;

/**
 * Created by 林智 on 2016/8/13.
 */
public interface ShoppingcartService extends BaseService<Shoppingcart>{

    Map dataTable(String searchText, int sEcho, PageBean pageBean, int u_id);

    Shoppingcart selectById(int s_id);

    void deleteById(int s_id);

    void updateInfo(Shoppingcart shoppingcart);

    void addShoppingCart(Shoppingcart shoppingcart);

    Shoppingcart isRepeat(Shoppingcart shoppingcart);
    
}
