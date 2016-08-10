package com.work.service;

import com.work.been.PageBean;
import com.work.model.Goods;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

/**
 * Created by 林智 on 2016/8/7.
 */
public interface GoodsService extends BaseService<Goods>{

    Map dataTable(String searchText, int sEcho, PageBean pageBean);

    Goods selectById(int gt_id);

    void deleteById(int gt_id);

    void updateInfo(Goods goods);

    void addGoods(Goods goods);

    void saveOrUpdatePicture(Goods goods, MultipartFile picture);

}
