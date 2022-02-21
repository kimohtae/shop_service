package com.person.shoppingmall_service.mapper;

import java.util.List;

import com.person.shoppingmall_service.data.OrderInfoVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OrderMapper {
    void insertOrderInfo(List<OrderInfoVO> itemList);

}
