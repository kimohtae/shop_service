package com.person.shoppingmall_service.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import com.person.shoppingmall_service.data.ProductVO;
import com.person.shoppingmall_service.mapper.CategoryMapper;
import com.person.shoppingmall_service.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    private static final int SECTION_COUNT = 3;
    private static final int ITEM_PER_SECTION = 4;

    @Autowired ProductMapper prod_mapper;
    @Autowired CategoryMapper cate_mapper;

    @GetMapping("/")
    public String getMain(Model model){
        model.addAttribute("recommend_list", prod_mapper.selectRecommendProducts());
        List<Integer> cate_seq_list = prod_mapper.selectProductCategories();
        List<Integer> sections = new ArrayList<>();
        for(int i=0; i<SECTION_COUNT; i++){
            int r = (int)Math.floor(Math.random()*cate_seq_list.size());
            sections.add(cate_seq_list.get(r));
            cate_seq_list.remove(r);
        }

        List<Map<String,Object>> map_list = new ArrayList<Map<String,Object>>();
        for(int i=0; i<sections.size(); i++){
            Map<String, Object> prod_map = new LinkedHashMap<String, Object>();
            prod_map.put("title", cate_mapper.selectCategoryName(sections.get(i)));
            prod_map.put("list", getRandCategoryProduct(sections.get(i)));
            map_list.add(prod_map);
        }
        model.addAttribute("prod_map_list", map_list);
        return "/index";
    }

    public List<ProductVO> getRandCategoryProduct(Integer cate_seq){
        Integer item_cnt = ITEM_PER_SECTION;
        List<ProductVO> origin = prod_mapper.selectRecommendByCateSeq(cate_seq);
        if(origin.size() < item_cnt) return origin;
        List<ProductVO> generated = new ArrayList<ProductVO>();
        for(int i=0; i<item_cnt; i++){
            int r = (int)Math.floor(Math.random()*origin.size());
            generated.add(origin.get(r));
            origin.remove(r);
        }
        return generated;
    }
}
