package com.gzyz.controller.introduction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gzyz.service.introduction.service.IntroductionService;

@Controller
@RequestMapping("items")
public class IntroductionController {
	
	@Autowired
	private IntroductionService introductionService;
	
	@RequestMapping("itemsIntroduction")
	public String itemsIntroduction(String goods_id) {
		
		return "/JSP/RP/introduction.jsp";
	}
}
