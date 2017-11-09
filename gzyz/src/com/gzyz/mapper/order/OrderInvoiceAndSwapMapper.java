package com.gzyz.mapper.order;

import java.util.List;

import com.gzyz.bean.order.Order_invoice;

public interface OrderInvoiceAndSwapMapper {
	//分页查询退货表
	public List<Order_invoice> queryAllInvoiceLimit(int startindex);
	//查询退货换单总数总数
	public int queryInvoiceCount();
	//同意申请
	public void agreeTheApply(int invoice_id);
}
