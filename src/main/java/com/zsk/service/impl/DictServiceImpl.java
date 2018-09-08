package com.zsk.service.impl;

import com.zsk.dao.DictMapper;
import com.zsk.pojo.Datadict;
import com.zsk.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DictServiceImpl implements DictService {
    @Autowired
    private DictMapper dictMapper;
    /**
     * 加载影片类别
     * @param dict_id
     * @return
     */
    public List<Datadict> getDictListByid(String dict_id) {
        return dictMapper.getDictListById(dict_id);
    }

    @Override
    public List<Datadict> getlistById(String dict_parent_id) {
        return dictMapper.getlistById(dict_parent_id);
    }

    @Override
    public Datadict getIdByName(String name) {
        return dictMapper.getIdByName(name);
    }
}
