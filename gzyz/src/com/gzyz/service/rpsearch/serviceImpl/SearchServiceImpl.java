package com.gzyz.service.rpsearch.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.rpsearch.searchextend.*;
import com.gzyz.mapper.rpsearch.SearchMapper;
import com.gzyz.service.rpsearch.service.SearchService;
@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchMapper searchMapper;

	@Override
	public List<GoodsAndSales> searchGoods(SearchAndIndex searchAndIndex) {
		// TODO Auto-generated method stub
		return searchMapper.searchGoods(searchAndIndex);
	}

	@Override
	public int searchGoodsCount(SearchAndIndex searchAndIndex) {
		// TODO Auto-generated method stub
		return searchMapper.searchGoodsCount(searchAndIndex);
	}

	@Override
	public List<BrandOfTheSearch> brandOfTheSearch(SearchAndIndex searchAndIndex) {
		// TODO Auto-generated method stub
		return searchMapper.brandOfTheSearch(searchAndIndex);
	}

	@Override
	public List<GoodsAndSales> searchGoodsByBrand(
			SearchAndIndexAndBrand searchAndIndexAndBrand) {
		// TODO Auto-generated method stub
		return searchMapper.searchGoodsByBrand(searchAndIndexAndBrand);
	}

	@Override
	public int searchGoodsByBrandCount(
			SearchAndIndexAndBrand searchAndIndexAndBrand) {
		// TODO Auto-generated method stub
		return searchMapper.searchGoodsByBrandCount(searchAndIndexAndBrand);
	}
}
