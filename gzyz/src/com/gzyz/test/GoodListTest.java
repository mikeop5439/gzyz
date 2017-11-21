package com.gzyz.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareEoW;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.rpsearch.searchextend.*;
import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.analysis.extend.GoodsNameAndSalesCount;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.DateQuery;
import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.MangerAndManageRole;
import com.gzyz.service.analysis.service.DateTrafficAnalysisService;
import com.gzyz.service.goods.service.GoodsListService;
import com.gzyz.service.login.service.HtLoginService;
import com.gzyz.service.order.service.OrderInvoiceAndSwapService;
import com.gzyz.service.rpsearch.service.SearchService;
import com.gzyz.service.users.service.ManagerListService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})
public class GoodListTest {
	@Autowired
	private HtLoginService htLoginService;
	@Autowired
	private SearchService searchService;
	@Test
	public void test1(){
		String searchOfKeywords="脑白金";
		ResultOfSearch resultOfSearch=new ResultOfSearch();
		SearchAndIndex searchAndIndex=new SearchAndIndex();
		searchAndIndex.setKeywords(searchOfKeywords);
		searchAndIndex.setNowindex(0);
		int count=searchService.searchGoodsCount(searchAndIndex);
		double  c=count;
		int allpage=(int) Math.ceil(c/8);
		resultOfSearch.setGoods(searchService.searchGoods(searchAndIndex));
		resultOfSearch.setAllpage(allpage);
		resultOfSearch.setNowpage(1);
		resultOfSearch.setCount(count);
		resultOfSearch.setKeywords(searchOfKeywords);
		resultOfSearch.setBrand(searchService.brandOfTheSearch(searchAndIndex));
		System.out.println("aaaaaaaaaaaa"+resultOfSearch);
	}
}
