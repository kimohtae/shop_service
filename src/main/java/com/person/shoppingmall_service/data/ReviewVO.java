package com.person.shoppingmall_service.data;

import lombok.Data;

@Data
public class ReviewVO {
    private Integer ri_seq;
    private String ri_content;
    private Integer ri_mi_seq;
    private Integer ri_pi_seq;
    private Integer ri_score;
    private Integer ri_oi_seq;
}
