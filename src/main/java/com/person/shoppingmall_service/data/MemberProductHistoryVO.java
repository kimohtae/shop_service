package com.person.shoppingmall_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class MemberProductHistoryVO {
    private Integer mph_seq;
    private Integer mph_mi_seq;
    private Integer mph_pi_seq;
    private Double mph_interval;
    private Date mph_reg_dt;
}
