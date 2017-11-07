package com.gzyz.controller.users;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.users.manger;
import com.gzyz.service.users.service.ManagerListService;

@Controller
@RequestMapping("manager")
public class ManagerListController {
	@Autowired
	private ManagerListService managerListService;
	
	//查询所有管理员
	@RequestMapping("queryAllManager.action")
	public String queryAllManager(Model model){
		List<manger> mangers=managerListService.queryAllManager();
		model.addAttribute("Manager", mangers);
		return "forward:/JSP/HT/users/The_manager_list.jsp";
	}
	
	//分页查询所有管理员
		@RequestMapping("queryAllManagerLimit.action")
		public String queryAllManagerLimit(Model model,int nowpage){
			int startindex=12*(nowpage-1);
			List<manger> mangers=managerListService.queryAllManagerLimit(startindex);
			model.addAttribute("Manager", mangers);
			return "forward:/JSP/HT/users/The_manager_list.jsp";
		}
	//异步查询所有管理员
	@RequestMapping("aqueryAllManager.action")
	public @ResponseBody List<manger> aqueryAllManager(){
		List<manger> mangers=managerListService.queryAllManager();
		return mangers;
	}
	//增加管理员
		@RequestMapping("insertManager.action")
		public String insertManager(Model model,manger manger){
			managerListService.insertManager(manger);
			return "forward:/manager/queryAllManager.action";
		}
	//修改管理员
		@RequestMapping("updateManager.action")
		public String updateManager(Model model,manger manger){
			managerListService.updateManager(manger);
			return "forward:/manager/queryAllManager.action";
		}
	//修改管理员前置查询
		@RequestMapping("queryBefroeUpdateManager.action")
		public @ResponseBody manger queryBefroeUpdateManager(Model model,int manger_id){
			manger manger=managerListService.queryBefroeUpdateManager(manger_id);
			return manger;
		}
	

}
