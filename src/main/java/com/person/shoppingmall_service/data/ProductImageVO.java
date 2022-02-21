package com.person.shoppingmall_service.data;

import lombok.Data;

@Data
public class ProductImageVO {
    private Integer pii_seq;
    private String pii_img_url;
    private Integer pii_pi_seq;
    private Boolean pii_thumb;
}
