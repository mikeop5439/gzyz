package com.gzyz.service.introduction.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gzyz.bean.introduction.extend.CommentInfo;
import com.gzyz.bean.introduction.extend.GetSpecId;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.bean.introduction.extend.GoodsInfo;

public interface IntroductionService {
	public List<GetSpecInfoId> getSpecInfoId(int goods_id);
	public int getSpecId(int spec_info_id);
	public String getSpecName(int spec_id);
	public String getSpecInfoValue(int spec_info_id);
	public List<GoodsInfo> getGoodsInfo(int goods_id);
	public int countComment(int goods_id);
	public List<CommentInfo> getCommentInfo(int goods_id);

}
