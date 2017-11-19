package com.gzyz.mapper.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.order.extend.OrderInfo;
import com.gzyz.bean.order.extend.OrderKeywords;
import com.gzyz.bean.order.extend.OrderVo;
import com.gzyz.bean.order.extend.StatusKeywords;

public interface OrderListMapper {
	public List<OrderVo> queryAllOrderList();
	public List<OrderVo> queryOrderByKeywords(OrderKeywords orderKeywords);
	public int queryAllOrderCounts(OrderKeywords orderKeywords);
	public List<OrderVo> queryOrderByLimit(OrderKeywords orderKeywords);
	public List<OrderInfo> queryOrderReceiverInfo(@Param("order_id")int order_id);
	public void updateOrderShippingNameInfo(StatusKeywords statusKeywords);
	public void updateOrderShippingCodeInfo(StatusKeywords statusKeywords);
	public void updateReceiverStateInfo(StatusKeywords statusKeywords);
	public void updateReceiverCityInfo(StatusKeywords statusKeywords);
	public void updateReceiverDistrictInfo(StatusKeywords statusKeywords);
	public void updateReceiverAddressInfo(StatusKeywords statusKeywords);
}
