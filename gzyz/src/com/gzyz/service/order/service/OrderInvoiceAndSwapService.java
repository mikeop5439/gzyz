package com.gzyz.service.order.service;

import java.util.List;

import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.DateQueryNowpage;
import com.gzyz.bean.order.extend.OrderAndUserAndOrderDetails;
import com.gzyz.bean.order.extend.OrderDateAndUsernameAndOrderId;

public interface OrderInvoiceAndSwapService {
	//分页查询退货表
	public List<Order_invoice> queryAllInvoiceLimit(int startindex);
	//查询退货换单总数总数
	public int queryInvoiceCount();
	//同意申请
	public void agreeTheApply(int invoice_id);
	//按日期分页查询
	public List<Order_invoice> qureyByDateLimit(DateQueryNowpage dateQueryNowpage);
	//按日期查询退货换单总数总数
	public int queryDateInvoiceCount(DateQueryNowpage dateQueryNowpage);
	//按日期，或则用户名查询订单
	public List<OrderAndUserAndOrderDetails> queryTheOrder(OrderDateAndUsernameAndOrderId orderDateAndUsernameAndOrderId);
	//订单查询详细表数量
	public int queryTheOrderCount(OrderDateAndUsernameAndOrderId orderDateAndUsernameAndOrderId);
}
