package com.person.shoppingmall_service.api;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.person.shoppingmall_service.data.CategoryVO;
import com.person.shoppingmall_service.mapper.CategoryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/category")
public class CategoryAPIController {
    @Autowired CategoryMapper cate_mapper;
    
    @GetMapping("/get")
    public Map<String,Object> getCategories(){
        Map<String,Object> map = new LinkedHashMap<>();
        List<CategoryVO> root_cate = cate_mapper.selectCategories(0);
        List<Map<String,Object>> root_cate_map = new ArrayList<Map<String,Object>>();
        
        for(CategoryVO cate:root_cate){
            Map<String,Object> cate_map = new LinkedHashMap<>();
            cate_map.put("seq", cate.getCate_seq());
            cate_map.put("name", cate.getCate_name());
            root_cate_map.add(cate_map);
            
            List<CategoryVO> mid_cate_list = cate_mapper.selectCategories(cate.getCate_seq());
            List<Map<String,Object>> mid_cate_map_list = new ArrayList<Map<String,Object>>();
            
            for(CategoryVO mid_cate:mid_cate_list){
                Map<String,Object> mid_cate_map = new LinkedHashMap<>();
                mid_cate_map.put("seq", mid_cate.getCate_seq());
                mid_cate_map.put("name", mid_cate.getCate_name());
                mid_cate_map.put("sub", cate_mapper.selectCategories(mid_cate.getCate_seq()));
                mid_cate_map_list.add(mid_cate_map);
            }
            
            cate_map.put("sub", mid_cate_map_list);
        }
        map.put("categories", root_cate_map);


        return map;
    }
}
