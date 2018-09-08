package com.zsk.utils;




import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import java.io.IOException;
import java.util.List;

public class JsonUtils {
    public static String java2Json(Object o , String[] excludes) {
        JsonConfig jsonConfig = new JsonConfig();
        //指定那些属性不需要传递
        jsonConfig.setExcludes(excludes);


        //String json = JSONObject.fromObject(pageBean).toString();
        jsonConfig.setIgnoreDefaultExcludes(false);
        JSONArray resultArray  = JSONArray.fromObject(o,jsonConfig);
        String json = JSONObject.fromObject(o,jsonConfig).toString();
        return json;
    }
    //转化Java为json
    public static String java2Json(List o , String[] excludes) {
        JsonConfig jsonConfig = new JsonConfig();
        //指定那些属性不需要传递
        jsonConfig.setExcludes(excludes);

        String json = JSONArray.fromObject(o,jsonConfig).toString();
        //String json = JSONObject.fromObject(pageBean).toString();
       return json;
    }
}
