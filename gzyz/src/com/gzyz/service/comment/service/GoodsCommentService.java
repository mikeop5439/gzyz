package com.gzyz.service.comment.service;

import java.util.List;

import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.comment.extend.CommentVo;



public interface GoodsCommentService {
	/*public List<Comment> queryAllComment();*/
	public List<CommentVo> queryCommentList(String goods_name);
	public List<CommentVo> queryCommentByLimit(CommentPageKeywords commentPageKeywords);
	public int queryAllCommentCounts(String goods_name);
	public void updateCommentStatusToFlase(int comment_id);
}
