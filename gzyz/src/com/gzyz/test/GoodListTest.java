package com.gzyz.test;

import java.util.Date;
import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareEoW;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.MangerAndManageRole;
import com.gzyz.service.goods.service.GoodsListService;
import com.gzyz.service.users.service.ManagerListService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})
public class GoodListTest {
	@Autowired
	private GoodsListService goodsListService;
	@Autowired
	private ManagerListService managerListService;
	@Test
	public void test1(){
		 /*MangerAndManageRole mangers=managerListService.queryBefroeUpdateManagerRole(34);
		 System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa:"+mangers);*/
		Manager_log manager_log=new Manager_log();
		manager_log.setManager_id(1);
		manager_log.setLog_method("test");
		manager_log.setLog_time(new Date());
		manager_log.setLog_origin("测试地址");
		managerListService.insertLog(manager_log);
	}
}
