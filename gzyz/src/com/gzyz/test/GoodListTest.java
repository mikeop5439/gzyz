package com.gzyz.test;

import java.util.Date;
import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareEoW;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.analysis.extend.DateTraffice;
import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.MangerAndManageRole;
import com.gzyz.service.analysis.service.DateTrafficAnalysisService;
import com.gzyz.service.goods.service.GoodsListService;
import com.gzyz.service.order.service.OrderInvoiceAndSwapService;
import com.gzyz.service.users.service.ManagerListService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})
public class GoodListTest {
	@Autowired
	private GoodsListService goodsListService;
	@Autowired
	private ManagerListService managerListService;
	@Autowired
	private OrderInvoiceAndSwapService orderInvoiceAndSwapService;
	@Autowired
	private DateTrafficAnalysisService dateTrafficAnalysisService;
	@Test
	public void test1(){
		/*List<OrderAndUserAndOrderDetails> orderAndUserAndOrderDetails=orderInvoiceAndSwapService.queryTheOrder();
		System.out.println("aaaaaaaaaaaaaaa"+orderAndUserAndOrderDetails);*/
		List<DateTraffice> dateTraffices=dateTrafficAnalysisService.queryDateTraffic();
		System.out.println("aaaaaaaaaaaaaaa"+dateTraffices);
	}
}
