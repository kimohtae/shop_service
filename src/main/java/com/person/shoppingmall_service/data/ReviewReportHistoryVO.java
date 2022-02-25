package com.person.shoppingmall_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewReportHistoryVO {
    private Integer rrh_seq;
    private Integer rrh_mi_seq;
    private Integer rrh_ri_seq;
    private Date rrh_reg_dt;
}
