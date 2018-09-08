package com.zsk.service;

import com.zsk.pojo.Datadict;

import java.util.List;

public interface DictService {
    List<Datadict> getDictListByid(String dict_id);
    List<Datadict> getlistById(String dict_parent_id);

    public Datadict getIdByName(String name);
}
