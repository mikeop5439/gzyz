package com.gzyz.mapper.goods;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.goods.extend.CommentVo;

public interface GoodsCommentMapper {
	/*public List<Comment> queryAllComment();*/
	public List<CommentVo> queryCommentList(@Param("goods_name") String goods_name);
}
