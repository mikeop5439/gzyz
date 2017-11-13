package com.gzyz.controller.analysis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.analysis.extend.CustomerAnalysis;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.order.Order_invoice;
import com.gzyz.service.analysis.service.DateTrafficAnalysisService;

@Controller
@RequestMapping("analysisDF")
public class DateTrafficAnalysisController {
	@Autowired
	private DateTrafficAnalysisService dateTrafficAnalysisService;
	//流量分析
	@RequestMapping("dateanalysis.action")
	public @ResponseBody List<DateTraffice> dateanalysis(Model model){
		List<DateTraffice> dateTraffice=dateTrafficAnalysisService.queryDateTraffic();
		return dateTraffice;
	}
	//客户分析
	@RequestMapping("queryReceiverCityCount.action")
	public @ResponseBody List<CustomerAnalysis> queryReceiverCityCount(Model model){
		List<CustomerAnalysis> customerAnalysis=dateTrafficAnalysisService.queryReceiverCityCount();
		return customerAnalysis;
	}
}
