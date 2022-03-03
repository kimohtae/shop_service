package com.person.shoppingmall_service.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.person.shoppingmall_service.data.CategoryVO;
import com.person.shoppingmall_service.data.MemberVO;
import com.person.shoppingmall_service.data.ProductVO;
import com.person.shoppingmall_service.mapper.CategoryMapper;
import com.person.shoppingmall_service.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired ProductMapper prod_mapper;
    @Autowired CategoryMapper cate_mapper;

    @GetMapping("/detail")
    public String getProductDetail(@RequestParam Integer index,Model model,HttpSession session){
        MemberVO login_user = (MemberVO)session.getAttribute("login_user");
        if(login_user != null){
            Calendar c = Calendar.getInstance();
            model.addAttribute("item_seq", index);
            model.addAttribute("conn_time",c.getTimeInMillis());
        }
        ProductVO item = prod_mapper.selectProductBySeq(index);
        Double plus = (item.getDiscounted_price()*10)%10>=5 ? 1.0 : 0;
        item.setDiscounted_price(item.getDiscounted_price() - item.getDiscounted_price()%1 + plus);

        model.addAttribute("score", prod_mapper.selectProductScore(index));
        model.addAttribute("item", item);
        model.addAttribute("item_img", prod_mapper.selectProductImages(index));
        model.addAttribute("item_desc_img", prod_mapper.selectProductDescImages(index));
        model.addAttribute("item_desc", prod_mapper.selectProductDesc(index));
        return "/product/detail";
    }
    @GetMapping("/list")
    public String getProductList(@RequestParam Integer category, @RequestParam @Nullable Integer offset , Model model){
        List<CategoryVO> sub_cate_list = cate_mapper.selectSubCategories(category);
        List<Integer> cate_seq_list = new ArrayList<Integer>();
        cate_seq_list.add(category);
        for(CategoryVO cate:sub_cate_list){
            cate_seq_list.add(cate.getCate_seq());
            List<CategoryVO> sub_sub_cate_list = cate_mapper.selectSubCategories(cate.getCate_seq());
            for(CategoryVO cate2:sub_sub_cate_list){
                cate_seq_list.add(cate2.getCate_seq());
            }
        }
        if(offset==null)offset=0;
        Integer cnt = prod_mapper.selectProductCntByCateSeqList(cate_seq_list);
        Integer page = cnt/12 + (cnt%12>0?1:0);

        model.addAttribute("page", page);
        model.addAttribute("category", category);
        model.addAttribute("cate_name", cate_mapper.selectCategoryName(category));
        model.addAttribute("list",prod_mapper.selectProductsByCateList(cate_seq_list, offset));
        model.addAttribute("page_type","category");
        return "/product/list";
    }
    
    @GetMapping("/search")
    public String getProductSearch(
            @RequestParam String type,
            @RequestParam String keyword,
            @RequestParam @Nullable Integer offset,
            Model model
        ){
            if(offset==null)offset=0;
            model.addAttribute("keyword",keyword);
            if(keyword==null){
                keyword = "%%";
            }else{
                keyword = "%"+keyword+"%";
            }
            Integer cnt = prod_mapper.selectProductSearchCnt(keyword, type);
            Integer page = cnt/12 + (cnt%12>0?1:0);
    
            model.addAttribute("page", page);
            model.addAttribute("list",prod_mapper.selectProductSearch(keyword, offset, type));
            model.addAttribute("type",type);
            model.addAttribute("offset",offset);
            model.addAttribute("page_type","search");
            return "/product/list";
        }
}
