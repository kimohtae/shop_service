package com.person.shoppingmall_service.mapper;

import java.util.List;

import com.person.shoppingmall_service.data.OrderInfoVO;
import com.person.shoppingmall_service.data.OrderSummaryVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
    void insertOrderInfo(List<OrderInfoVO> itemList);
    List<OrderSummaryVO> selectOrderSummary(Integer seq, Integer offset);
    Integer selectOrderSummaryCount(Integer seq);
    
}
