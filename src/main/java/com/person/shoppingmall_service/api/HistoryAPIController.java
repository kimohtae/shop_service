package com.person.shoppingmall_service.api;

import com.person.shoppingmall_service.data.MemberProductHistoryVO;
import com.person.shoppingmall_service.data.PageConnectHistoryVO;
import com.person.shoppingmall_service.mapper.HistoryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/history")
public class HistoryAPIController {
    @Autowired HistoryMapper history_mapper;
    
    @PutMapping("/prod")
    public String putProductHistory(@RequestBody MemberProductHistoryVO data){
        if(data.getMph_mi_seq() != null){
            history_mapper.insertMemeberProductHistory(data);
            return "History Inserted";
        }
        return "Require Login (User number is null)";
    }
    
    @PutMapping("/page")
    public String putProductPageHistory(@RequestBody PageConnectHistoryVO data){
        if(data.getPch_mi_seq() != null){
            history_mapper.insertPageConnectHistory(data);
            return "History Inserted";
        }
        return "Require Login (User number is null)";
    }
}
