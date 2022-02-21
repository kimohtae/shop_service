package com.person.shoppingmall_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class ShoppingCartVO {
    private Integer scd_seq;
    private Integer scd_mi_seq;
    private Integer scd_pi_seq;
    private Integer scd_count;
    private Date scd_reg_dt;
    private Date scd_mod_dt;
    private Integer scd_status;
}
