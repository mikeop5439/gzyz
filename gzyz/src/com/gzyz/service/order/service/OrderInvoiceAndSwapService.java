package com.gzyz.service.order.service;

import java.util.List;

import com.gzyz.bean.order.Order_invoice;

public interface OrderInvoiceAndSwapService {
	//分页查询退货表
	public List<Order_invoice> queryAllInvoiceLimit(int startindex);
	//查询退货换单总数总数
	public int queryInvoiceCount();
	//同意申请
	public void agreeTheApply(int invoice_id);

}
