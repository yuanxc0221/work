package com.work.model;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.List;
@Table(name = "goods_type")
public class Goods_type {
    private Integer gt_id;

    private String gt_introduction;

    private String gt_name;
    @Transient
    private List<Goods> goodsList;

    @Override
    public String toString() {
        return "Goods_type{" +
                "gt_id=" + gt_id +
                ", gt_introduction='" + gt_introduction + '\'' +
                ", gt_name='" + gt_name + '\'' +
                ", goodsList=" + goodsList +
                '}';
    }

    public Integer getGt_id() {
        return gt_id;
    }

    public void setGt_id(Integer gt_id) {
        this.gt_id = gt_id;
    }

    public String getGt_introduction() {
        return gt_introduction;
    }

    public void setGt_introduction(String gt_introduction) {
        this.gt_introduction = gt_introduction;
    }

    public String getGt_name() {
        return gt_name;
    }

    public void setGt_name(String gt_name) {
        this.gt_name = gt_name;
    }

    public List<Goods> getGoodsList() {
        return goodsList;
    }

    public void setGoodsList(List<Goods> goodsList) {
        this.goodsList = goodsList;
    }
}