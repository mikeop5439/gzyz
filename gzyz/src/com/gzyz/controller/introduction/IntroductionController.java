package com.gzyz.controller.introduction;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gzyz.bean.introduction.extend.CommentInfo;
import com.gzyz.bean.introduction.extend.GetSpecInfoId;
import com.gzyz.bean.introduction.extend.GoodsInfo;
import com.gzyz.service.introduction.service.IntroductionService;

@Controller
@RequestMapping("items")
public class IntroductionController {
	
	@Autowired
	private IntroductionService introductionService;
	
	@RequestMapping("itemsIntroduction")
	public String itemsIntroduction(Model model) {
		
		//int param = Integer.parseInt(goods_id);
		int a = 0;
		List<Integer> getSpecIds = new ArrayList<Integer>();
		List<String> getSpecNames = new ArrayList<String>();
		List<String> getSpecInfoValues = new ArrayList<String>();
		List<String> result = new ArrayList<String>();
		
		List<GetSpecInfoId> getSpecInfoIds = introductionService.getSpecInfoId(1);
		
		List<GoodsInfo> goodsInfos = introductionService.getGoodsInfo(1);
		
		List<Integer> comments = new ArrayList<Integer>();
		comments.add(introductionService.countComment(1));
		
		List<CommentInfo> commentInfos = introductionService.getCommentInfo(1);
		
		for (int i = 0; i < getSpecInfoIds.size(); i++) {
			int spec_info_id = getSpecInfoIds.get(i).getSpec_info_id();
			
			int spec_id = introductionService.getSpecId(spec_info_id);
			getSpecIds.add(spec_id);

			String spec_name = introductionService.getSpecName(spec_id);
			getSpecNames.add(spec_name);
			
			String spec_info_value = introductionService.getSpecInfoValue(spec_info_id);
			getSpecInfoValues.add(spec_info_value);			
			
			String key = spec_name+":"+"&nbsp;"+spec_info_value;
			result.add(key);
		}
		
		model.addAttribute("goodsinfo", goodsInfos);
		model.addAttribute("getSpecNames", getSpecNames);
		model.addAttribute("getSpecInfoValues", getSpecInfoValues);
		model.addAttribute("result", result);
		model.addAttribute("comments", comments);
		model.addAttribute("commentinfos", commentInfos);
		return "/JSP/RP/introduction.jsp";
	}
}
