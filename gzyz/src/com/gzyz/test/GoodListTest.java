package com.gzyz.test;

import java.util.List;

import org.aspectj.internal.lang.annotation.ajcDeclareEoW;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.GoodsAndCategory;
import com.gzyz.bean.users.manger;
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
		 List<manger> mangers=managerListService.queryAllManagerLimit(0);
		 System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaa:"+mangers);
	}
}
