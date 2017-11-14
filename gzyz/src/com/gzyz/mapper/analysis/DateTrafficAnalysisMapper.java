package com.gzyz.mapper.analysis;

import java.util.List;

import com.gzyz.bean.analysis.extend.CustomerAnalysis;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.analysis.extend.GoodsNameAndSalesCount;

public interface DateTrafficAnalysisMapper {
	//流量分析查询
	public List<DateTraffice> queryDateTraffic();
	//查询每个城市的购买量 
	public List<CustomerAnalysis> queryReceiverCityCount();
	//查询销售类前十的商品
	public List<GoodsNameAndSalesCount> queryTopGoods();
	//查询销售额类前十的商品
	public List<GoodsNameAndSalesCount> queryTopGoodsFree();
	//查询销量前十的分类
	public List<GoodsNameAndSalesCount> queryTopCategorySales();
	//查询销售额前十的分类
	public List<GoodsNameAndSalesCount> queryTopCategoryFree();
	//查询购买量前十的用户
	public List<GoodsNameAndSalesCount> queryTopConsumption();
}
