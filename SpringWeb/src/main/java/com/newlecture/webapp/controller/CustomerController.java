package com.newlecture.webapp.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.NoticeView;

@Controller
@RequestMapping("/customer/*")
public class CustomerController {

	@Autowired
	private NoticeDao noticeDao;
	
	@RequestMapping("notice")
	public String notice(
			@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value = "f", defaultValue = "title") String field,
			@RequestParam(value = "q", defaultValue = "") String query, 
			Model model) {
		
		List<NoticeView> list = noticeDao.getList(page, field, query);
		model.addAttribute("list", list);
		
		return "customer.notice.list";
	}
	@RequestMapping("notice-ajax")
	@ResponseBody
	public String noticeAjax(
			@RequestParam(value = "p", defaultValue = "1") Integer page,
			@RequestParam(value = "f", defaultValue = "title") String field,
			@RequestParam(value = "q", defaultValue = "") String query, 
			Model model) {
		
		List<NoticeView> list = noticeDao.getList(page, field, query);
		
		String json = "";

		Gson gson = new Gson();
		json = gson.toJson(list);
		
		/*
		StringBuilder builer = new StringBuilder();
		builer.append("[");
		builer.append("{\"id\":+list.get(0).getId()+"\", \"title\":\"Hello"},");
		builer.append("{}");
		builer.append("}");
		json= builer.toString();
		*/
		
		//return "[{id:\"1\"},{id:\"2\"}]";
		return json;
		
	}
	
	@RequestMapping("notice/{id}")
	public String noticeDetail(
			@PathVariable("id") String id,
			Model model) {
		model.addAttribute("n",noticeDao.get(id));
		model.addAttribute("prev",noticeDao.getPrev(id));
		model.addAttribute("next",noticeDao.getNext(id));
		
		return "customer.notice.detail";
	}
}
