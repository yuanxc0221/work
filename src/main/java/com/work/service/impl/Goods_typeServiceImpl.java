package com.work.service.impl;

import com.work.been.PageBean;
import com.work.dao.Goods_typeMapper;
import com.work.model.Goods_type;
import com.work.service.Goods_typeService;
import com.work.util.BaseMapper;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 林智 on 2016/8/6.
 */
@Service
public class Goods_typeServiceImpl extends BaseServiceImpl<Goods_type> implements Goods_typeService{

    @Autowired
    Goods_typeMapper goods_typeMapper;

    @Override
    protected BaseMapper<Goods_type> getBaseMapper() {
        return goods_typeMapper;
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
        List<Goods_type> list  = goods_typeMapper.selectAllGoods_type(parameterMap);
        int cout=goods_typeMapper.countAll(parameterMap);
        pageBean.init(cout,list);
        Map<String,Object> map=new HashedMap();
        map.put("sEcho", sEcho+1);//不知道是什么,每次加一就好
        map.put("iTotalRecords", list.size());//当前总数据条数
        map.put("iTotalDisplayRecords",cout);//查询结果的总条数
        map.put("aaData", list);
        return map;
    }

    @Override
    public Goods_type selectById(int gt_id) {
        return goods_typeMapper.selectById(gt_id);
    }

    @Override
    public void deleteById(int gt_id) {
        goods_typeMapper.deleteById(gt_id);
    }

    @Override
    public void updateInfo(Goods_type goods_type) {
        goods_typeMapper.updateInfo(goods_type);
    }

    @Override
    public void addGoods_type(Goods_type goods_type) {
        goods_typeMapper.addGoods_type(goods_type);
    }
}
