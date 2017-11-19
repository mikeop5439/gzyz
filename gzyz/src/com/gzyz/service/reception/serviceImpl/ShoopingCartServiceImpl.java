package com.gzyz.service.reception.serviceImpl;

import java.util.List;








import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.gzyz.bean.goods.Goods;
import com.gzyz.bean.order.Order;
import com.gzyz.bean.order.Order_details;
import com.gzyz.bean.users.Receiver;
import com.gzyz.bean.users.User;
import com.gzyz.bean.users.extend.Cartextend;
import com.gzyz.bean.users.extend.UserCart;
import com.gzyz.mapper.reception.ShoopingCartMapper;
import com.gzyz.service.reception.service.ShoopingCartService;

@Service
public class ShoopingCartServiceImpl implements ShoopingCartService {
	@Autowired
	@Qualifier("shoopingCartMapper")
	private ShoopingCartMapper shoopingCartMapper;


	public List<UserCart> queryShoopingcart(int i) {
		// 查询用户购物车
		
		return shoopingCartMapper.selectcart(i);
	}


	@Override
	public void changecartnumber(Cartextend cartextend) {
		// 修改购物车商品数量
		shoopingCartMapper.updatecartgoodsnumber(cartextend);
		
	}


	@Override
	public void deletecartByidone(Cartextend cartextend) {
		// 删除单个购物车商品
		shoopingCartMapper.deletecartByidone(cartextend);
	}


	@Override
	public Cartextend querycartNP(Cartextend cartextend) {
		// 查询购物车数量和单价
		
		return shoopingCartMapper.selectcartNP(cartextend);
	}


	@Override
	public Goods querygoods(int parseInt) {
		// 查询商品
		return shoopingCartMapper.selectgoods(parseInt);
	}


	@Override
	public List<Receiver> selectuserreceiver(int user_id) {
		// 查询用户收货地址
		return shoopingCartMapper.selectuserreceiver(user_id);
	}


	@Override
	public void updatemorenaddress(User user) {
		 //设置用户的默认地址
		shoopingCartMapper.updatemorenaddress(user);
	}


	@Override
	public User queryuserservice(int user_id) {
		// 查询用户默认收货地址
		return shoopingCartMapper.selectuserrs(user_id);
	}


	@Override
	public void insertOrder(Order order) {
		// 增加订单信息
		shoopingCartMapper.insertorser(order);
		
	}


	@Override
	public int queryOrderid(Order order) {
		// 查询订单信息
		
		return shoopingCartMapper.selectorderid(order);
	}


	@Override
	public void insertOrder_details(Order_details details) {
		//增加订单详情
		shoopingCartMapper.insertorderdetails(details);
	}
	
}
