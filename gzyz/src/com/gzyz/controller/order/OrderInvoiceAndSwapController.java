package com.gzyz.controller.order;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.order.Order_invoice;
import com.gzyz.bean.order.extend.Order_invoiceAnadAllpage;
import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.ManagerLogAndAllpage;
import com.gzyz.service.order.service.OrderInvoiceAndSwapService;
import com.gzyz.service.order.service.OrderListService;
import com.gzyz.service.users.service.ManagerListService;

@Controller
@RequestMapping("orderiands")
public class OrderInvoiceAndSwapController {
	@Autowired
	private OrderInvoiceAndSwapService orderInvoiceAndSwapService;
	@Autowired
	private Manager_log manager_log;
	@Autowired
	private ManagerListService managerListService;
	//同步分页查询所有管理员
	@RequestMapping("squeryAllInvoiceLimit.action")
	public String squeryAllManagerLimit(Model model,int nowpage){
		int startindex=12*(nowpage-1);
		double count=orderInvoiceAndSwapService.queryInvoiceCount();
        int allpage=(int) Math.ceil(count/12.0);
		List<Order_invoice> order_invoices=orderInvoiceAndSwapService.queryAllInvoiceLimit(startindex);
		model.addAttribute("order_invoices", order_invoices);
		model.addAttribute("AllPage", allpage);
		return "forward:/JSP/HT/orders/order_invoice_list.jsp";
	}
	//异步分页查询所有管理员
	@RequestMapping("aqueryAllInvoiceLimit.action")
	public @ResponseBody Order_invoiceAnadAllpage aqueryAllInvoiceLimit(Model model,int nowpage){
		int startindex=12*(nowpage-1);
		double count=orderInvoiceAndSwapService.queryInvoiceCount();
        int allpage=(int) Math.ceil(count/12.0);
        List<Order_invoice> order_invoices=orderInvoiceAndSwapService.queryAllInvoiceLimit(startindex);
        Order_invoiceAnadAllpage order_invoiceAnadAllpage=new Order_invoiceAnadAllpage();
        order_invoiceAnadAllpage.setOrder_invoices(order_invoices);
        order_invoiceAnadAllpage.setAllpage(allpage);
		return order_invoiceAnadAllpage;
	}
	//同意退货请求
	@RequestMapping("agreeTheApply.action")
	public String agreeTheApply(Model model,int invoice_id){
		//添加日志
		manager_log.setManager_id(1);
		manager_log.setLog_time(new Date());
		manager_log.setLog_origin("退货单列表界面");
		manager_log.setLog_method("同意退货单ID:"+invoice_id+"的退货请求");
		managerListService.insertLog(manager_log);
		//添加日志结束
		orderInvoiceAndSwapService.agreeTheApply(invoice_id);
		return "forward:/orderiands/squeryAllInvoiceLimit.action?nowpage=1";
	}
}
