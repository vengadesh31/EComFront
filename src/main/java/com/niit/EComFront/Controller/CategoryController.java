package com.niit.EComFront.Controller;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.EComBack.dao.CategoryDao;
import com.niit.EComBack.model.Category;

@Controller
public class CategoryController {
	@Autowired
	CategoryDao CategoryDao;

	@RequestMapping("/category")
	public String categorypage(Model M) {
		M.addAttribute("editmode",false);
		Category c = new Category();
		M.addAttribute("category", c);
		M.addAttribute("categorypage", true);
		M.addAttribute("haserror", false);
		M.addAttribute("catlist", CategoryDao.showAllCategory());
		return "index";
	}

	@RequestMapping(value = "/addCategory", method = RequestMethod.POST)
	public String addCategory(@Valid @ModelAttribute("category") Category category, BindingResult br, Model M) 
	{
		if (br.hasErrors()) 
		{   M.addAttribute("editmode",false);
		    System.out.println("error");
			M.addAttribute("category", category);
			M.addAttribute("catlist", CategoryDao.showAllCategory());
			M.addAttribute("categorypage", true);
			M.addAttribute("haserror", true);
			M.addAttribute("error", "please check your data");
			return "index";

		} 
		else 
		{
			try 
			{
				CategoryDao.addCategory(category);
				return "redirect:/category";
			} 
			catch (Exception e) 
			{   M.addAttribute("editmode",false);
				M.addAttribute("category", category);
				M.addAttribute("catlist", CategoryDao.showAllCategory());
				M.addAttribute("categorypage", true);
				M.addAttribute("haserror", true);
				M.addAttribute("error", "Data Already Present");
				return "index";

			}
		}
	}


	@RequestMapping("/deletecategory")
	public String deleteCategory(@RequestParam("catname")String catname,Model m)
	{
		Category category=CategoryDao.showoneCategory(catname);
		CategoryDao.deleteCategory(category);
		return "redirect:/category";
	}
	@RequestMapping("/editcategory")
	public String editCategory(@RequestParam("catname")String catname,Model m)
	{
		
		m.addAttribute("editmode", true);
		m.addAttribute("category",CategoryDao.showoneCategory(catname));		
		m.addAttribute("categorypage", true);
		m.addAttribute("haserror", false);
		m.addAttribute("catlist",CategoryDao.showAllCategory());
		return "index";
	}
	
	@RequestMapping(value = "/updateCategory", method = RequestMethod.POST)
	public String updateCategory(@Valid @ModelAttribute("category") Category category, BindingResult br, Model M) 
	{
		if (br.hasErrors()) 
		{   M.addAttribute("editmode",false);
		    System.out.println("error");
			M.addAttribute("category", category);			
			M.addAttribute("catlist", CategoryDao.showAllCategory());
			M.addAttribute("categorypage", true);
			M.addAttribute("haserror", true);
			M.addAttribute("error", "please check your data");
			return "index";

		} 
		else 
		{
			try 
			{
				CategoryDao.updateCategory(category);
				return "redirect:/category";
			} 
			catch (Exception e) 
			{   M.addAttribute("edotmode",false);
				M.addAttribute("category", category);			
				M.addAttribute("catlist", CategoryDao.showAllCategory());
				M.addAttribute("categorypage", true);				
				M.addAttribute("haserror", true);
				M.addAttribute("error", "Data Already Present");
				return "index";

			}
		}
	}

	
	
}
