package com.zsk.dao;

import com.zsk.pojo.Datadict;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DictMapper {
    List<Datadict> getDictListById(String dict_id);
    public Datadict getDatadictByid(String dict_id);

    List<Datadict> getlistById(String dict_parent_id);

    public Datadict getIdByName(String name);
}
