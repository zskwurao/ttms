package com.zsk.utils;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConveter implements Converter<String,Date>{
    private static final String[] PATTERNS = {"yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd", "HH:mm:ss"};
    @Override
    public Date convert(String s) {
        if(!StringUtils.isBlank(s)) {
            try {
                return DateUtils.parseDateStrictly(s, PATTERNS);
            } catch (Exception e) {
                //异常时参数绑定失败
            }
        }
        return null;
    }

}
