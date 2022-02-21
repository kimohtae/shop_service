package com.person.shoppingmall_service.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.person.shoppingmall_service.data.CartInfoVO;
import com.person.shoppingmall_service.data.MemberVO;
import com.person.shoppingmall_service.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired ProductMapper prod_mapper;
    public static Integer order_price = 0;

    @GetMapping("/checkout")
    public String getOrderCheckout(Model model, HttpSession session){
        MemberVO login_user = (MemberVO)session.getAttribute("login_user");
        if(login_user == null) return "redirect:/member/login";
        
        List<CartInfoVO> item_list = prod_mapper.selectCartInfo(login_user.getMi_seq());
        int prod_price = 0;
        int delivery_price = 0;
        
        for(CartInfoVO item:item_list){
            prod_price += item.getDiscounted_price() * item.getScd_count();
            delivery_price += item.getDi_price();
        }

        order_price = prod_price + delivery_price;

        model.addAttribute("order_items", item_list);
        model.addAttribute("prod_price", prod_price);
        model.addAttribute("delivery_price", delivery_price);
        model.addAttribute("total_price", order_price);

        return "/order/checkout";
    }
}
