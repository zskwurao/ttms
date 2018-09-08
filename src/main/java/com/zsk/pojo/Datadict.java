package com.zsk.pojo;

import java.io.Serializable;
import java.util.List;

public class Datadict implements Serializable {
    /*create table data_dict
(
   dict_id              int not null auto_increment,
   dict_parent_id       int,
   dict_index           int,
   dict_name            varchar(200),
   dict_value           varchar(100) not null,
   primary key (dict_id)
);*/
    private Integer dict_id;
    private Integer dict_parent_id;
    private Integer dict_index;
    private String dict_name;
    private String dict_value;
    private List<Play> playList;

    public List<Play> getPlayList() {
        return playList;
    }

    public void setPlayList(List<Play> playList) {
        this.playList = playList;
    }

    public String getDict_value() {
        return dict_value;
    }

    public void setDict_value(String dict_value) {
        this.dict_value = dict_value;
    }

    public String getDict_name() {

        return dict_name;
    }

    public void setDict_name(String dict_name) {
        this.dict_name = dict_name;
    }

    public Integer getDict_index() {

        return dict_index;
    }

    public void setDict_index(Integer dict_index) {
        this.dict_index = dict_index;
    }

    public Integer getDict_parent_id() {
        return dict_parent_id;
    }

    public void setDict_parent_id(Integer dict_parent_id) {
        this.dict_parent_id = dict_parent_id;
    }

    public Integer getDict_id() {
        return dict_id;
    }

    public void setDict_id(Integer dict_id) {
        this.dict_id = dict_id;
    }
}
