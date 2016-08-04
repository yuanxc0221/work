package com.work.dao;

import com.work.model.Goods;

import java.util.List;
import java.util.Map;

public interface GoodsMapper {
    public List<Goods> selectAllGoods(Map<String,Object> getPageBean);

    public int countAll(Map<String,Object> getPageBean);

    void updateInfo(Goods goods);

    Goods selectById(int g_id);

    void deleteById(int g_id);
}