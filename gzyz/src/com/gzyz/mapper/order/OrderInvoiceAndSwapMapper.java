package com.gzyz.mapper.order;

import java.util.List;

import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.DateQueryNowpage;

public interface OrderInvoiceAndSwapMapper {
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
}
