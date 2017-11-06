package com.gzyz.service.goods.service;

import java.util.List;

import com.gzyz.bean.goods.extend.CommentVo;


public interface GoodsCommentService {
	/*public List<Comment> queryAllComment();*/
	public List<CommentVo> queryCommentList(String goods_name);
}
