package com.work.service;

import com.work.been.PageBean;
import com.work.model.Goods_type;

import java.util.Map;

/**
 * Created by 林智 on 2016/8/6.
 */
public interface Goods_typeService extends BaseService<Goods_type>{

    Map dataTable(String searchText, int sEcho, PageBean pageBean);

    Goods_type selectById(int gt_id);

    void deleteById(int gt_id);

    void updateInfo(Goods_type goods_type);

    void addGoods_type(Goods_type goods_type);
}
