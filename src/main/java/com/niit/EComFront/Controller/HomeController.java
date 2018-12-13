package com.niit.EComFront.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController
{

	@RequestMapping({"/","/index"})
	public String indexpage(Model M) 
	{
		M.addAttribute("carouselpage", true);
		return "index";			
	}
	@RequestMapping(value ="/contactus")
	public String contactus(Model M) 
	{
		M.addAttribute("contactuspage", true);
		return "index";			
	}
	@RequestMapping(value ="/aboutus")
	public String aboutus(Model M) 
	{
		M.addAttribute("aboutuspage", true);
		return "index";			
	}
	@RequestMapping(value ="/login")
	public String login(Model M) 
	{
		M.addAttribute("loginpage", true);
		return "index";			
	}
	
	@RequestMapping(value ="/category1")
	public String category1(Model M) 
	{
		M.addAttribute("category1page", true);
		return "index";			
	}
	
	@RequestMapping(value ="/register")
	public String register(Model M) 
	{
		M.addAttribute("registerpage", true);
		return "index";			
	}
	
	
	
	
	
}
