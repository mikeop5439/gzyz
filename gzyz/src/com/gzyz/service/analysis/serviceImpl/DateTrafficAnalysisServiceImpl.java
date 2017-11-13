package com.gzyz.service.analysis.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.analysis.extend.CustomerAnalysis;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.mapper.analysis.DateTrafficAnalysisMapper;
import com.gzyz.service.analysis.service.DateTrafficAnalysisService;
@Service
public class DateTrafficAnalysisServiceImpl implements DateTrafficAnalysisService{
	@Autowired
	private DateTrafficAnalysisMapper dateTrafficAnalysisMapper;

	@Override
	public List<DateTraffice> queryDateTraffic() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryDateTraffic();
	}

	@Override
	public List<CustomerAnalysis> queryReceiverCityCount() {
		// TODO Auto-generated method stub
		return dateTrafficAnalysisMapper.queryReceiverCityCount();
	}
}
