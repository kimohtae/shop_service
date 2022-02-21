package com.person.shoppingmall_service.mapper;

import java.util.List;

import com.person.shoppingmall_service.data.CategoryVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryMapper {
    public List<CategoryVO> selectCategories(Integer parent);
    public String selectCategoryName(Integer seq);
}
