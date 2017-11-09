package com.gzyz.service.order.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.order.Order_invoice;
import com.gzyz.mapper.order.OrderInvoiceAndSwapMapper;
import com.gzyz.service.order.service.OrderInvoiceAndSwapService;
@Service
public class OrderInvoiceAndSwapServiceImpl implements
		OrderInvoiceAndSwapService {
	@Autowired
	private OrderInvoiceAndSwapMapper orderInvoiceAndSwapMapper;

	@Override
	public List<Order_invoice> queryAllInvoiceLimit(int startindex) {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryAllInvoiceLimit(startindex);
	}

	@Override
	public int queryInvoiceCount() {
		// TODO Auto-generated method stub
		return orderInvoiceAndSwapMapper.queryInvoiceCount();
	}

	@Override
	public void agreeTheApply(int invoice_id) {
		// TODO Auto-generated method stub
		orderInvoiceAndSwapMapper.agreeTheApply(invoice_id);
	}
}
