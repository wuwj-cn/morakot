package com.sslnn.bpm.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.ProcessDefinition;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("bpm")
public class BpmController {
	@Resource
	RepositoryService repositoryService;

	@RequestMapping("bpm-list")
	public String list(Model model) {
		List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().list();
		for (ProcessDefinition definition : list) {
			System.out.println(definition.getName());
		}
		return "bpm/bpm";
	}
}
