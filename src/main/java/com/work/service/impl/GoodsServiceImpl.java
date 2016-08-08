package com.work.service.impl;

import com.work.been.PageBean;
import com.work.dao.GoodsMapper;
import com.work.model.Goods;
import com.work.service.GoodsService;
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
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    protected BaseMapper<Goods> getBaseMapper() {
        return goodsMapper;
    }


    @Override
    public Map dataTable(String searchText, int sEcho, PageBean pageBean) {
        System.out.println("111");
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
        List<Goods> list  = goodsMapper.selectAllGoods(parameterMap);
        int count=goodsMapper.countAll(parameterMap);
        pageBean.init(count,list);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords",count);//查询结果的总条数
        map.put("aaData", list);
        System.out.println("222");
        System.out.println(map);
        return map;
    }

    @Override
    public Goods selectById(int gt_id) {
        return goodsMapper.selectById(gt_id);
    }

    @Override
    public void deleteById(int gt_id) {
        goodsMapper.deleteById(gt_id);
    }

    @Override
    public void updateInfo(Goods goods) {
        goodsMapper.updateInfo(goods);
    }

    @Override
    public void addGoods(Goods goods) {
        goodsMapper.addGoods(goods);
    }

}
