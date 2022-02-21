package com.person.shoppingmall_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
    private Integer pi_seq;
    private String pi_name;
    private Integer pi_price;
    private String pi_info;
    private Double pi_discount_rate;
    private Double pi_point_rate;
    private Date pi_release_date;
    private Integer pi_stock;
    private Integer pi_status;
    private String cate_name;
    private Integer di_price;
    private String di_name;
    private String si_name;
    private String si_email;
    private String si_phone;
    private Integer si_seq;
    private String si_address;
    private String si_img_url;
    private String mfi_name;
    private String mfi_email;
    private String mfi_phone;
    private String thumbnail;
    private Double discounted_price;
    private Double saving_point;
    private Integer di_seq;
    private Integer mfi_seq;
    private Integer cate_seq;
    private String pi_sub_title;

}
