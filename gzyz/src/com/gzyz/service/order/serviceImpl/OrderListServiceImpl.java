package com.gzyz.service.order.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.order.extend.OrderInfo;
import com.gzyz.bean.order.extend.OrderKeywords;
import com.gzyz.bean.order.extend.OrderVo;
import com.gzyz.mapper.order.OrderListMapper;
import com.gzyz.service.order.service.OrderListService;

@Service
public class OrderListServiceImpl implements OrderListService {
	
	@Autowired
	private OrderListMapper orderListMapper;
	
	@Override
	public List<OrderVo> queryAllOrderList() {
		// TODO Auto-generated method stub
		return orderListMapper.queryAllOrderList();
	}

	@Override
	public List<OrderVo> queryOrderByKeywords(OrderKeywords orderKeywords) {
		// TODO Auto-generated method stub
		return orderListMapper.queryOrderByKeywords(orderKeywords);
	}

	@Override
	public int queryAllOrderCounts(OrderKeywords orderKeywords) {
		// TODO Auto-generated method stub
		return orderListMapper.queryAllOrderCounts(orderKeywords);
	}

	@Override
	public List<OrderVo> queryOrderByLimit(OrderKeywords orderKeywords) {
		// TODO Auto-generated method stub
		return orderListMapper.queryOrderByLimit(orderKeywords);
	}

	@Override
	public List<OrderInfo> queryOrderReceiverInfo(int order_id) {
		// TODO Auto-generated method stub
		return orderListMapper.queryOrderReceiverInfo(order_id);
	}

}
