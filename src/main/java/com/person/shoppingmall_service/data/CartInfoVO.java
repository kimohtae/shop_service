package com.person.shoppingmall_service.data;

import lombok.Data;

@Data
public class CartInfoVO {
    private Integer scd_seq;
    private String pi_name;
    private Integer pi_stock;
    private String di_name;
    private Integer di_price;
    private String si_name;
    private String si_phone;
    private String si_img_url;
    private String mfi_name;
    private Double discounted_price;
    private Double saving_point;
    private String thumbnail;
    private Integer pi_seq;
    private Integer mi_seq;
    private Integer scd_count;
    private Integer pi_price;
}
