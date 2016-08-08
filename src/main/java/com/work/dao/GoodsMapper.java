package com.work.dao;

import com.work.model.Goods;
import com.work.util.BaseMapper;

import java.util.List;
import java.util.Map;

public interface GoodsMapper extends BaseMapper<Goods> {
    public List<Goods> selectAllGoods(Map<String,Object> getPageBean);

    public int countAll(Map<String,Object> getPageBean);

    void updateInfo(Goods goods);

    Goods selectById(int g_id);

    void deleteById(int g_id);

    void addGoods(Goods goods);
}