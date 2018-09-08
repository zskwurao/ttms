package com.zsk.pojo;

import java.io.Serializable;

public class TTMS implements Serializable {
    private String name;
    private Integer money;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }
}
