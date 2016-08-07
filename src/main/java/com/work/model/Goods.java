package com.work.model;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
@Table(name = "goods")
public class Goods {
    private Integer g_id;

    private String introduction;

    private String name;

    private Date date;

    private String picture;

    private Double money;

    private Long goodsType;

    @Transient
    private Goods_type goods_type;

    @Override
    public String toString() {
        return "Goods{" +
                "g_id=" + g_id +
                ", introduction='" + introduction + '\'' +
                ", name='" + name + '\'' +
                ", date=" + date +
                ", picture='" + picture + '\'' +
                ", money=" + money +
                ", goodsType=" + goodsType +
                ", goods_type=" + goods_type +
                '}';
    }

    public Goods_type getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(Goods_type goods_type) {
        this.goods_type = goods_type;
    }

    public Long getGoodsType() {

        return goodsType;
    }

    public void setGoodsType(Long goodsType) {
        this.goodsType = goodsType;
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
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