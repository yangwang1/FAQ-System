package com.example.handlers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.BasicErrorController;
import org.springframework.boot.autoconfigure.web.DefaultErrorAttributes;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

/**
 * 自定义错误控制器
 */
@Controller //不可缺失
public class MyErrorController extends BasicErrorController {

    @Autowired
    public MyErrorController(ServerProperties serverProperties) {
        super(new DefaultErrorAttributes(), serverProperties.getError());
    }

    /**
     * 覆盖默认的Json响应
     */
    @Override
    public ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
        Map<String, Object> body = getErrorAttributes(request,
                isIncludeStackTrace(request, MediaType.ALL));
        HttpStatus status = getStatus(request);


        //输出自定义的Json格式
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("status", false);
        map.put("msg", body.get("message"));

        return new ResponseEntity<Map<String, Object>>(map, status);
    }

    /**
     * 覆盖默认的HTML响应
     */
    @Override
    public ModelAndView errorHtml(HttpServletRequest request, HttpServletResponse response) {
        response.setStatus(getStatus(request).value());
        Map<String, Object> model = getErrorAttributes(request,
                isIncludeStackTrace(request, MediaType.TEXT_HTML));

        //指定自定义的视图
        return new ModelAndView("errors", model);
    }
}