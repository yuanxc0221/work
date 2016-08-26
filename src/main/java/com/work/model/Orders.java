package com.work.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * Created by 林智 on 2016/8/15.
 */
@Table(name="orders")
public class Orders {
    private int o_id;
    private int goods_id;
    private int user_id;
    private Date o_time;
    private int o_sign;
    private int o_integrate;
    private int piece;
    private String remark;  //备注

    @Transient
    private Goods goods;
    @Transient
    private User user;


    @Override
    public String toString() {
        return "Orders{" +
                "o_id=" + o_id +
                ", goods_id=" + goods_id +
                ", user_id=" + user_id +
                ", o_time=" + o_time +
                ", o_sign=" + o_sign +
                ", o_integrate=" + o_integrate +
                ", piece=" + piece +
                ", remark='" + remark + '\'' +
                '}';
    }

    public int getO_id() {
        return o_id;
    }

    public void setO_id(int o_id) {
        this.o_id = o_id;
    }

    public int getGoods_id() {
        return goods_id;
    }

    public void setGoods_id(int goods_id) {
        this.goods_id = goods_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    public Date getO_time() {
        return o_time;
    }

    public void setO_time(Date o_time) {
        this.o_time = o_time;
    }

    public int getO_sign() {
        return o_sign;
    }

    public void setO_sign(int o_sign) {
        this.o_sign = o_sign;
    }

    public int getO_integrate() {
        return o_integrate;
    }

    public void setO_integrate(int o_integrate) {
        this.o_integrate = o_integrate;
    }

    public int getPiece() {
        return piece;
    }

    public void setPiece(int piece) {
        this.piece = piece;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
