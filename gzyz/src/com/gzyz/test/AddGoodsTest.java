package com.gzyz.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.service.goods.service.AddGoodsService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})

public class AddGoodsTest {
	@Autowired
	private AddGoodsService addGoodsService;
	@Test
	public void testCheckSpec_name(){
		
		addGoodsService.delectspec(14);
	}
}
