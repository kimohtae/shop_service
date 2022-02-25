package com.person.shoppingmall_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.person.shoppingmall_service.data.MemberVO;
import com.person.shoppingmall_service.data.ReviewReportHistoryVO;
import com.person.shoppingmall_service.data.ShoppingCartVO;
import com.person.shoppingmall_service.mapper.HistoryMapper;
import com.person.shoppingmall_service.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/product")
public class ProductAPIController {
    @Autowired ProductMapper prod_mapper;
    @Autowired HistoryMapper hist_mapper;

    @PutMapping("/cart")
    public Map<String, Object> putProductAsCart(@RequestBody ShoppingCartVO data){
        Map<String, Object> resultMap = new LinkedHashMap<>();

        ShoppingCartVO cart_data = prod_mapper.selectShoppingCartItem(data);
        if(cart_data != null){
            prod_mapper.updateProductCountToCart(data);
            resultMap.put("status", true);
            resultMap.put("operation", "increase");
            resultMap.put("message", "제품이 수량이 변경되었습니다.");
            return resultMap;
        }
        
        prod_mapper.insertProductToCart(data);
        resultMap.put("status", true);
        resultMap.put("operation", "add");
        resultMap.put("message", "제품이 장바구니에 추가되었습니다.");
        return resultMap;
    }

    @PatchMapping("/cart")
    public Map<String, Object> patchProductCartItem(@RequestBody ShoppingCartVO data){
        Map<String, Object> resultMap = new LinkedHashMap<>();
        prod_mapper.updateCartItemStatus(data);

        resultMap.put("status", true);
        if(data.getScd_status()==1){
            resultMap.put("operation", "buy");
            resultMap.put("operation", "제품구매");
        }else{
            resultMap.put("operation", "cancel");
            resultMap.put("operation", "장바구니에서 제품을 삭제했습니다.");
        }
        return resultMap;
    }

    @PatchMapping("/cart/count")
    public Map<String, Object> patchCartCount(@RequestParam Integer seq, @RequestParam Integer count){
        Map<String, Object> resultMap = new LinkedHashMap<>();

        prod_mapper.updateCartItemCount(seq, count);
        resultMap.put("status", true);
        resultMap.put("message", "수량이 변경되었습니다..");

        return resultMap;
    }
    
    @GetMapping("/cart/count")
    public Integer getCartCount(@RequestParam Integer member_seq){
        return prod_mapper.selectShoppingCartItemCount(member_seq);
    }

    @PatchMapping("/cart/delete")
    public String patchCartStatusToDelete(@RequestParam Integer seq){
        prod_mapper.updateCartItemStatusToDelete(seq);
        return "제품이 장바구니에서 제거되었습니다.";
    }

    @GetMapping("/review")
    public Map<String, Object> getProductReview(@RequestParam Integer pi_seq, @RequestParam Integer offset, HttpSession session){
        Map<String, Object> resultMap = new LinkedHashMap<>();
        MemberVO login_user = (MemberVO)session.getAttribute("login_user");
        Integer mi_seq = 0;
        if(login_user!=null){
            mi_seq = login_user.getMi_seq();
        }
        resultMap.put("list",  prod_mapper.selectReviewList(pi_seq, offset,mi_seq));
        resultMap.put("count", prod_mapper.selectReviewCnt(pi_seq));
        return resultMap;
    }
    
    @PatchMapping("/review/report")
    public Map<String, Object> patchProductReviewReport(@RequestParam Integer ri_seq, HttpSession session){
        Map<String, Object> resultMap = new LinkedHashMap<>();
        MemberVO login_user = (MemberVO)session.getAttribute("login_user");
        if(login_user == null){
            resultMap.put("status", false);
            resultMap.put("message", "리뷰 신고는 로그인 후 할 수 있습니다.");
            return resultMap;
        } 
        prod_mapper.updateReviewReport(ri_seq);
        ReviewReportHistoryVO data = new ReviewReportHistoryVO();
        data.setRrh_ri_seq(ri_seq);
        data.setRrh_mi_seq(login_user.getMi_seq());
        hist_mapper.insertReviewReportHistory(data);

        resultMap.put("status", true);
        resultMap.put("message", "신고가 접수되었습니다.");
        
        return resultMap;
    }
}
