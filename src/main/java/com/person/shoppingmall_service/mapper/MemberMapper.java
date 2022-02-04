package com.person.shoppingmall_service.mapper;

import com.person.shoppingmall_service.data.MemberVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    MemberVO loginMember(String user_email, String user_pwd);
    Integer checkEmail(String user_email);
    
    void insertMember(MemberVO data);
}
