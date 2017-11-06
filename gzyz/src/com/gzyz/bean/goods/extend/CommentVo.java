package com.gzyz.bean.goods.extend;

import com.gzyz.bean.goods.Comment;
import com.gzyz.bean.goods.Goods;

public class CommentVo extends Comment{
	
	private Goods goods;
	private String formatDateString; //yyyy-MM-dd
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public String getFormatDateString() {
		return formatDateString;
	}
	public void setFormatDateString(String formatDateString) {
		this.formatDateString = formatDateString;
	}
 
}
