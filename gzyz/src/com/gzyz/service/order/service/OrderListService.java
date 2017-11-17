package com.gzyz.service.order.service;

import java.util.List;

import com.gzyz.bean.order.extend.OrderInfo;
import com.gzyz.bean.order.extend.OrderKeywords;
import com.gzyz.bean.order.extend.OrderVo;

public interface OrderListService {
	public List<OrderVo> queryAllOrderList();
	public List<OrderVo> queryOrderByKeywords(OrderKeywords orderKeywords);
	public int queryAllOrderCounts(OrderKeywords orderKeywords);
	public List<OrderVo> queryOrderByLimit(OrderKeywords orderKeywords);
	public List<OrderInfo> queryOrderReceiverInfo(int order_id);
}
