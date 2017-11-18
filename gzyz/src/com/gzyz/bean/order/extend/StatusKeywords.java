package com.gzyz.bean.order.extend;

public class StatusKeywords {
	private String shipping_name;
	private int order_id;
	private String shipping_code;
	
	public String getShipping_name() {
		return shipping_name;
	}
	public void setShipping_name(String shipping_name) {
		this.shipping_name = shipping_name;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getShipping_code() {
		return shipping_code;
	}
	public void setShipping_code(String shipping_code) {
		this.shipping_code = shipping_code;
	}
	
	@Override
	public String toString() {
		return "StatusKeywords [shipping_name=" + shipping_name + ", order_id="
				+ order_id + ", shipping_code=" + shipping_code + "]";
	}

}
