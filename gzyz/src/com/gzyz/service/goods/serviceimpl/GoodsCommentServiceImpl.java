package com.gzyz.service.goods.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.gzyz.service.goods.service.GoodsCommentService;
import com.gzyz.bean.goods.extend.CommentVo;
import com.gzyz.mapper.goods.GoodsCommentMapper;
import com.gzyz.mapper.goods.GoodsListMapper;;
/*import com.goods.bean.Comment;
import com.goods.bean.CommentVo;
import com.goods.mapper.GoodsCommentMapper;
import com.goods.service.GoodsCommentService;*/

@Service
public class GoodsCommentServiceImpl implements GoodsCommentService {
	
	@Autowired
	private GoodsCommentMapper goodsCommentMapper;

	/*@Override
	public List<Comment> queryAllComment() {
		// TODO Auto-generated method stub
		return goodsCommentMapper.queryAllComment();
	}*/

	@Override
	public List<CommentVo> queryCommentList(String goods_name) {
		// TODO Auto-generated method stub
		
		return goodsCommentMapper.queryCommentList(goods_name);
	}

}
