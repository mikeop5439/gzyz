package com.gzyz.controller.users;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzyz.bean.users.Manager_log;
import com.gzyz.bean.users.manage_role;
import com.gzyz.bean.users.manger;
import com.gzyz.bean.users.extend.MangerAndManageRole;
import com.gzyz.service.users.service.ManagerListService;

@Controller
@RequestMapping("manager")
public class ManagerListController {
	@Autowired
	private ManagerListService managerListService;
	@Autowired
	private Manager_log manager_log;
	
	//查询所有管理员
	@RequestMapping("queryAllManager.action")
	public String queryAllManager(Model model){
		List<manger> mangers=managerListService.queryAllManager();
		model.addAttribute("Manager", mangers);
		return "forward:/JSP/HT/manager/The_manager_list.jsp";
	}
	
	//分页查询所有管理员
		@RequestMapping("queryAllManagerLimit.action")
		public String queryAllManagerLimit(Model model,int nowpage){
			int startindex=12*(nowpage-1);
			List<manger> mangers=managerListService.queryAllManagerLimit(startindex);
			model.addAttribute("Manager", mangers);
			return "forward:/JSP/HT/manager/The_manager_list.jsp";
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
			//添加日志
			manager_log.setManager_id(1);
			manager_log.setLog_time(new Date());
			manager_log.setLog_origin("管理员列表界面");
			manager_log.setLog_method("新增加一个管理员");
			managerListService.insertLog(manager_log);
			//添加日志结束
			managerListService.insertManager(manger);
			return "forward:/manager/queryAllManager.action";
		}
	//修改管理员
		@RequestMapping("updateManager.action")
		public String updateManager(Model model,manger manger){
			//添加日志
			manager_log.setManager_id(1);
			manager_log.setLog_time(new Date());
			manager_log.setLog_origin("管理员列表界面");
			manager_log.setLog_method("修改ID："+manger.getManger_id()+"的管理员");
			managerListService.insertLog(manager_log);
			//添加日志结束
			managerListService.updateManager(manger);
			return "forward:/manager/queryAllManager.action";
		}
	//修改管理员前置查询
		@RequestMapping("queryBefroeUpdateManager.action")
		public @ResponseBody manger queryBefroeUpdateManager(Model model,int manger_id){
			manger manger=managerListService.queryBefroeUpdateManager(manger_id);
			return manger;
		}
	//修改查重
		@RequestMapping("updateCheck.action")
		public @ResponseBody int updateCheck(Model model,String manger_name){
			int flage=managerListService.updateCheck(manger_name);
			return flage;
		}
	//删除管理员
		@RequestMapping("deleteManager.action")
		public String deleteManager(int manger_id){
			//添加日志
			manager_log.setManager_id(1);
			manager_log.setLog_time(new Date());
			manager_log.setLog_origin("管理员列表界面");
			manager_log.setLog_method("删除ID："+manger_id+"的管理员");
			managerListService.insertLog(manager_log);
			//添加日志结束
			managerListService.deleteManager(manger_id);
			return "forward:/manager/queryAllManager.action";
		}
    //查询管理员和角色
		@RequestMapping("queryManagerAndRole.action")
		public String queryManagerAndRole(Model model){
			List<MangerAndManageRole> mangerAndManageRoles=managerListService.queryManagerAndRole();
			model.addAttribute("Role", mangerAndManageRoles);
			return "forward:/JSP/HT/manager/manager_role.jsp";
		}
	//修改角色前置查询
		@RequestMapping("queryBefroeUpdateManagerRole.action")
		public @ResponseBody MangerAndManageRole queryBefroeUpdateManagerRole(Model model,int manger_id){
			MangerAndManageRole manger=managerListService.queryBefroeUpdateManagerRole(manger_id);
			return manger;
		}
	//更新管理员角色
		@RequestMapping("updateManagerRole.action")
		public String updateManagerRole(Model model,manage_role manage_role){
			//添加日志
			manager_log.setManager_id(1);
			manager_log.setLog_time(new Date());
			manager_log.setLog_origin("角色管理界面");
			manager_log.setLog_method("更新管理员ID:"+manage_role.getManage_role_id()+"的角色为"+manage_role.getManage_role_type());
			managerListService.insertLog(manager_log);
			//添加日志结束
			managerListService.updateManagerRole(manage_role);
			return "forward:/manager/queryManagerAndRole.action";
		}
		
	//修改角色为无角色
		@RequestMapping("updateManagerNoneRole.action")
		public String updateManagerNoneRole(Model model,int manage_role_id){
			//添加日志
			manager_log.setManager_id(1);
			manager_log.setLog_time(new Date());
			manager_log.setLog_origin("角色管理界面");
			manager_log.setLog_method("修改管理员ID:"+manage_role_id+"的角色为无角色");
			managerListService.insertLog(manager_log);
			//添加日志结束
			managerListService.updateManagerNoneRole(manage_role_id);
			return "forward:/manager/queryManagerAndRole.action";
		}
	//分页查询日志
		@RequestMapping("queryLogLimit.action")
		public String queryLogLimit(Model model,int nowpage){
			int startindex=12*(nowpage-1);
			List<Manager_log> manager_logs= managerListService.queryLogLimit(startindex);
			model.addAttribute("Logs", manager_logs);
			return "forward:/JSP/HT/manager/manager_log.jsp";
		}
}
