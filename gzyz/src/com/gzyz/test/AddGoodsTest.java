package com.gzyz.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.goods.extend.GoodsCollect;
import com.gzyz.bean.users.extend.UserCollect;
import com.gzyz.bean.users.extend.Userdate;
import com.gzyz.service.users.service.UserListService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})

public class AddGoodsTest {
	@Autowired
	private UserListService userListService;
	@Test
	public void testCheckSpec_name(){
		List<Integer>weekranking_goodsid=userListService.selectweekranking();
		List<Goods>weekrankinggoodslist=new ArrayList<>();
		for (int id:weekranking_goodsid){
			Goods goods=userListService.queryweekrankinggoods(id);
			weekrankinggoodslist.add(goods);
		}

}
	}