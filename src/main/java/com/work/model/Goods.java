package com.work.model;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;
@Table(name = "goods")
public class Goods {
    private Integer g_id;

    private String introduction;    //商品介绍, 主要用在富文本编辑器上

    private String name;

    private Date date;

    private String picture;

    private Double money;

    private int goods_type_id;

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
                ", goods_type_id=" + goods_type_id +
                ", goods_type=" + goods_type +
                '}';
    }

    public Integer getG_id() {
        return g_id;
    }

    public void setG_id(Integer g_id) {
        this.g_id = g_id;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public int getGoods_type_id() {
        return goods_type_id;
    }

    public void setGoods_type_id(int goods_type_id) {
        this.goods_type_id = goods_type_id;
    }

    public Goods_type getGoods_type() {
        return goods_type;
    }

    public void setGoods_type(Goods_type goods_type) {
        this.goods_type = goods_type;
    }
}