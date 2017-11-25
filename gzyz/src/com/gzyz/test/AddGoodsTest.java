package com.gzyz.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
		Random random = new Random();
		int rdnum=random.nextInt(50000);
		Date time=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMHHss");
		int order_id=Integer.parseInt(sdf.format(time))+rdnum;
		System.out.println(order_id);

}
	}