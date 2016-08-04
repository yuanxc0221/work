package com.work.dao;

import com.work.model.Goods_type;

import java.util.List;
import java.util.Map;

public interface Goods_typeMapper {
    public List<Goods_type> selectAllGoods_type(Map<String,Object> getPageBean);

    public int countAll(Map<String,Object> getPageBean);

    void updateInfo(Goods_type goods_type);

    Goods_type selectById(int gt_id);

    void deleteById(int gt_id);

}