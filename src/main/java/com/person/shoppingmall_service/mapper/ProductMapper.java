package com.person.shoppingmall_service.mapper;

import java.util.List;
import java.util.Map;

import com.person.shoppingmall_service.data.ProductImageVO;
import com.person.shoppingmall_service.data.CartInfoVO;
import com.person.shoppingmall_service.data.ProductDescImageVO;
import com.person.shoppingmall_service.data.ProductDescVO;
import com.person.shoppingmall_service.data.ProductVO;
import com.person.shoppingmall_service.data.ReviewVO;
import com.person.shoppingmall_service.data.ShoppingCartVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
    List<ProductVO> selectProductsAll();
    List<ProductVO> selectRecommendProducts();
    List<ProductVO> selectRecommendByCateSeq(Integer seq);
    List<Integer> selectProductCategories();
    
    ProductVO selectProductBySeq(Integer seq);
    List<ProductImageVO> selectProductImages(Integer seq);
    List<ProductDescImageVO> selectProductDescImages(Integer seq);
    List<ProductDescVO> selectProductDesc(Integer seq);
    
    void insertProductToCart(ShoppingCartVO data);
    ShoppingCartVO selectShoppingCartItem(ShoppingCartVO data);
    void updateProductCountToCart(ShoppingCartVO data);
    void updateCartItemStatus(ShoppingCartVO data);
    void updateCartItemCount(Integer seq, Integer count);

    Integer selectShoppingCartItemCount(Integer member_seq);
    
    List<CartInfoVO> selectCartInfo(Integer seq);
    void updateCartItemStatusToDelete(Integer seq);

    List<ProductVO> selectProductsByCateList(List<Integer> seq_list,Integer offset);
    Integer selectProductCntByCateSeqList(List<Integer> seq_list);
    List<ProductVO> selectProductSearch(String keyword, Integer offset, String type);
    Integer selectProductSearchCnt(String keyword, String type);

    List<ReviewVO> selectReviewList(Integer pi_seq, Integer offset, Integer mi_seq);
    Map<String, Object> selectProductScore(Integer pi_seq);
    Integer selectReviewCnt(Integer pi_seq);

    void updateReviewReport(Integer ri_seq);

}
