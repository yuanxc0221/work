package com.work.model;

import java.util.Date;

public class Goods {
    private Integer g_id;

    private String introduction;

    private String name;

    private Date date;

    private Goods_type goodsType = new Goods_type();

    private String picture;

    private Double money;

    public Goods(Date date, Integer g_id, String introduction, String name, Goods_type goodsType, String picture, Double money) {
        this.date = date;
        this.g_id = g_id;
        this.introduction = introduction;
        this.name = name;
        this.goodsType = goodsType;
        this.picture = picture;
        this.money = money;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    public Goods_type getGoodsType() {
        return goodsType;
    }

    public void setGoodsType(Goods_type goodsType) {
        this.goodsType = goodsType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }
}