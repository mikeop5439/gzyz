package com.gzyz.service.introduction.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzyz.bean.comment.extend.CommentPageKeywords;
import com.gzyz.bean.introduction.extend.CommentInfo;
import com.gzyz.bean.introduction.extend.CommentInfoByPage;
import com.gzyz.bean.introduction.extend.GetSpecId;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.bean.introduction.extend.GoodsInfo;
import com.gzyz.mapper.introduction.IntroductionMapper;
import com.gzyz.service.introduction.service.IntroductionService;

@Service
public class IntroductionServiceImpl implements IntroductionService {

	@Autowired
	private IntroductionMapper introductionMapper;
	@Override
	public List<GetSpecInfoId> getSpecInfoId(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecInfoId(goods_id);
	}
	@Override
	public int getSpecId(int spec_info_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecId(spec_info_id);
	}
	@Override
	public String getSpecName(int spec_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecName(spec_id);
	}
	@Override
	public String getSpecInfoValue(int spec_info_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getSpecInfoValue(spec_info_id);
	}
	@Override
	public List<GoodsInfo> getGoodsInfo(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getGoodsInfo(goods_id);
	}
	@Override
	public int countComment(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.countComment(goods_id);
	}
	@Override
	public List<CommentInfo> getCommentInfo(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getCommentInfo(goods_id);
	}
	@Override
	public List<CommentInfo> getCommentInfoByPage(
			CommentInfoByPage commentInfoByPage) {
		// TODO Auto-generated method stub
		return introductionMapper.getCommentInfoByPage(commentInfoByPage);
	}
	@Override
	public int getCommentCount(int goods_id) {
		// TODO Auto-generated method stub
		return introductionMapper.getCommentCount(goods_id);
	}

}
