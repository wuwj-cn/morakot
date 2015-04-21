package com.sslnn.bpm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("extjs")
public class ExtController {

	@RequestMapping("list")
	public void list(int start, int limit, HttpServletResponse response) {
		String json = "{totalProperty: 100, root: [";
		for (int i = start; i < (start + limit); i++) {
			json += "{id: " + i + ", name: 'name" + i + "', descn: 'descn" + i
					+ "'}";
			if (i != start + limit - 1) {
				json += ",";
			}
		}
		json += "]}";
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
