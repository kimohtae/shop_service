package com.person.shoppingmall_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class OrderInfoVO {
    private Integer oi_seq;
    private Integer oi_pi_seq;
    private Integer oi_mi_seq;
    private Integer oi_si_seq;
    private Integer oi_price;
    private Integer oi_count;
    private String oi_shipping_name;
    private String oi_shipping_address;
    private String oi_shipping_phone;
    private String oi_shipping_request;
    private String oi_pay_type;
    private Integer oi_delivery_status;
    private String oi_delivery_number;
    private Integer oi_status;
    private Date oi_reg_dt;
    private Date oi_mod_dt;
    private Integer delivery_price;
}
