package com.person.shoppingmall_service.controller;

import com.person.shoppingmall_service.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired ProductMapper prod_mapper;

    @GetMapping("/detail")
    public String getProductDetail(@RequestParam Integer index,Model model){
        model.addAttribute("item", prod_mapper.selectProductBySeq(index));
        model.addAttribute("item_img", prod_mapper.selectProductImages(index));
        model.addAttribute("item_desc_img", prod_mapper.selectProductDescImages(index));
        model.addAttribute("item_desc", prod_mapper.selectProductDesc(index));
        return "/product/detail";
    }
}
