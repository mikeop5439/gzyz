package com.gzyz.service.order.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.order.extend.OrderInfo;
import com.gzyz.bean.order.extend.OrderKeywords;
import com.gzyz.bean.order.extend.OrderVo;
import com.gzyz.bean.order.extend.StatusKeywords;
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

	@Override
	public void updateOrderShippingNameInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateOrderShippingNameInfo(statusKeywords);
		
	}

	@Override
	public void updateOrderShippingCodeInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateOrderShippingCodeInfo(statusKeywords);
	}

	@Override
	public void updateReceiverStateInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverStateInfo(statusKeywords);	
	}

	@Override
	public void updateReceiverCityInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverCityInfo(statusKeywords);
	}

	@Override
	public void updateReceiverDistrictInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverDistrictInfo(statusKeywords);
	}

	@Override
	public void updateReceiverAddressInfo(StatusKeywords statusKeywords) {
		orderListMapper.updateReceiverAddressInfo(statusKeywords);
	}
}
