package com.work.model;

import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * Created by 林智 on 2016/8/12.
 */
@Table(name="shoppingcart")
public class Shoppingcart {
    private int s_id;
    private int goods_id;
    private int user_id;
    private int piece;      //商品件数
    private Date s_time;

    @Transient
    private Goods goods;
    @Transient
    private User user;

    @Override
    public String toString() {
        return "Shoppingcart{" +
                "s_id=" + s_id +
                ", goods_id=" + goods_id +
                ", user_id=" + user_id +
                ", piece=" + piece +
                ", s_time=" + s_time +
                '}';
    }

    public int getS_id() {
        return s_id;
    }

    public void setS_id(int s_id) {
        this.s_id = s_id;
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

    public int getPiece() {
        return piece;
    }

    public void setPiece(int piece) {
        this.piece = piece;
    }

    public Date getS_time() {
        return s_time;
    }

    public void setS_time(Date s_time) {
        this.s_time = s_time;
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
