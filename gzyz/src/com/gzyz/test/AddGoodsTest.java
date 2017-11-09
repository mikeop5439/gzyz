package com.gzyz.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gzyz.bean.goods.extend.GoodsCollect;
import com.gzyz.bean.users.extend.UserCollect;
import com.gzyz.service.users.service.UserListService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:com/config/applicationContext.xml"})

public class AddGoodsTest {
	@Autowired
	private UserListService userListService;
	@Test
	public void testCheckSpec_name(){
		List<UserCollect> collects=userListService.queryCollect(0);
		for(UserCollect u:collects){
			for(GoodsCollect g:u.getGoodsCollect()){
				String imgString=g.getOriginal_img().substring(36);
				g.setOriginal_img(imgString);
				System.out.println(g.getOriginal_img());
		}
		
	}

}
	}