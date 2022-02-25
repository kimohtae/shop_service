package com.person.shoppingmall_service.mapper;

import com.person.shoppingmall_service.data.MemberProductHistoryVO;
import com.person.shoppingmall_service.data.PageConnectHistoryVO;
import com.person.shoppingmall_service.data.ReviewReportHistoryVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HistoryMapper {
    void insertReviewReportHistory(ReviewReportHistoryVO data);
    void insertPageConnectHistory(PageConnectHistoryVO data);
    void insertMemeberProductHistory(MemberProductHistoryVO data);
}
