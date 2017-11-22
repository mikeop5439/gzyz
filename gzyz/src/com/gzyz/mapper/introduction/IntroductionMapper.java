package com.gzyz.mapper.introduction;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.comment.extend.CommentVo;
import com.gzyz.bean.introduction.extend.CommentInfo;
import com.gzyz.bean.introduction.extend.CommentInfoByPage;
import com.gzyz.bean.introduction.extend.GetSpecId;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.bean.introduction.extend.GoodsInfo;

public interface IntroductionMapper {
	
	public List<GetSpecInfoId> getSpecInfoId(@Param("goods_id") int goods_id);
	public int getSpecId(@Param("spec_info_id") int spec_info_id);
	public String getSpecName(@Param("spec_id") int spec_id);
	public String getSpecInfoValue(@Param("spec_info_id") int spec_info_id);
	public List<GoodsInfo> getGoodsInfo(@Param("goods_id") int goods_id);
	public int countComment(@Param("goods_id") int goods_id);
	public List<CommentInfo> getCommentInfo(@Param("goods_id") int goods_id);
	public List<CommentInfo> getCommentInfoByPage(CommentInfoByPage commentInfoByPage);
	public int getCommentCount(@Param("goods_id") int goods_id);
}
