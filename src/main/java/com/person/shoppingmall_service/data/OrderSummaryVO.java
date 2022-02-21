package com.person.shoppingmall_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class OrderSummaryVO {
    private Integer oi_seq;
    private Integer oi_mi_seq;
    private Integer oi_price;
    private Integer oi_count;
    private Integer oi_delivery_status;
    private String oi_delivery_number;
    private Integer oi_status;
    private Date oi_reg_dt;
    private Date oi_mod_dt;
    private Integer pi_seq;
    private String pi_name;
    private String img;
    private Boolean r_able;
}
