package com.gzyz.service.rpsearch.service;

import java.util.List;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.rpsearch.searchextend.*;

public interface SearchService {
	//搜索商品
	public List<GoodsAndSales> searchGoods(SearchAndIndex searchAndIndex);
	//搜索商品（商品总数）
	public int searchGoodsCount(SearchAndIndex searchAndIndex);
	//搜索商品的分类
	public List<BrandOfTheSearch> brandOfTheSearch(SearchAndIndex searchAndIndex);
	//通过品牌查询商品
	public List<GoodsAndSales> searchGoodsByBrand(SearchAndIndexAndBrand searchAndIndexAndBrand);
	//通过品牌查询商品总数
	public int searchGoodsByBrandCount(SearchAndIndexAndBrand searchAndIndexAndBrand);
}
