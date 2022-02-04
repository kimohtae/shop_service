package com.person.shoppingmall_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
    private Integer mi_seq;
    private String mi_email;
    private String mi_pwd;
    private String mi_name;
    private String mi_birth;
    private Integer mi_gen;
    private String mi_address;
    private String mi_phone;
    private Integer mi_grade;
    private Integer mi_status;
    private Date mi_reg_dt;
    private Date mi_leave_dt;
    private Integer mi_role;
}
