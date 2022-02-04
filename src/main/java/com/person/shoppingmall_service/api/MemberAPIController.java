package com.person.shoppingmall_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import com.person.shoppingmall_service.data.MemberVO;
import com.person.shoppingmall_service.mapper.MemberMapper;
import com.person.shoppingmall_service.util.AESAlgorithm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/member")
public class MemberAPIController {
    @Autowired MemberMapper mapper;

    @PostMapping("/add")
    public Map<String,Object> postMemberJoin(@RequestBody MemberVO data)throws Exception{
        Map<String, Object> resultMap = new LinkedHashMap<String,Object>();
        if(mapper.checkEmail(data.getMi_email())>0){
            resultMap.put("status", false);
            resultMap.put("err_type", "duplicate");
            resultMap.put("message", data.getMi_email()+"은/는 이미 존재하는 Email 입니다.");
            return resultMap;
        }

        data.setMi_pwd(AESAlgorithm.Encrypt(data.getMi_pwd()));
        mapper.insertMember(data);

        resultMap.put("status", true);
        resultMap.put("message", "회원 등록이 완료 되었습니다.");
        return resultMap;
    }
}
