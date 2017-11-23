package com.gzyz.service.introduction.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.introduction.extend.CommentInfo;
import com.gzyz.bean.introduction.extend.CommentInfoByPage;
import com.gzyz.bean.introduction.extend.GetSpecId;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.bean.introduction.extend.GoodsInfo;
import com.gzyz.bean.introduction.extend.RelatedGoods;
import com.gzyz.bean.introduction.extend.RelatedGoodsKey;

public interface IntroductionService {
	public List<GetSpecInfoId> getSpecInfoId(int goods_id);
	public int getSpecId(int spec_info_id);
	public String getSpecName(int spec_id);
	public String getSpecInfoValue(int spec_info_id);
	public List<GoodsInfo> getGoodsInfo(int goods_id);
	public int countComment(int goods_id);
	public List<CommentInfo> getCommentInfo(int goods_id);
	public List<CommentInfo> getCommentInfoByPage(CommentInfoByPage commentInfoByPage);
	public int getCommentCount(int goods_id); 
	public String getGoodsKey(@Param("goods_id") int goods_id);
	public List<RelatedGoods> getRelatedGoods(RelatedGoodsKey relatedGoodsKey);
	public int getRelatedGoodsCount(@Param("keywords") String keywords);
}
