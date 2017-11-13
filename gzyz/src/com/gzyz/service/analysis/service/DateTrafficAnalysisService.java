package com.gzyz.service.analysis.service;

import java.util.List;

import com.gzyz.bean.analysis.extend.CustomerAnalysis;
import com.gzyz.bean.analysis.extend.DateTraffice;

public interface DateTrafficAnalysisService {
	//流量分析查询
	public List<DateTraffice> queryDateTraffic();
	//查询每个城市的购买量 
	public List<CustomerAnalysis> queryReceiverCityCount();

}
