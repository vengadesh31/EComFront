package com.niit.EComFront.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.EComBack.dao.UserDetailDAO;
import com.niit.EComBack.model.UserDetail;

@Controller
public class LoginController {
@Autowired
UserDetailDAO userDetailDAO;

@RequestMapping("/reg")
public String regPage(Model m)
{
        m.addAttribute("userModel", new UserDetail());
        m.addAttribute("regPage", true);
        m.addAttribute("haserror", false);
        return "index";
}
@RequestMapping(value = "adduserdetail", method = RequestMethod.POST)
public String adduser(@Valid @ModelAttribute("userModel") UserDetail
userDetail, BindingResult br, Model m)
{
        if (br.hasErrors())
        {
                m.addAttribute("regPage", true);
                m.addAttribute("userModel", userDetail);
                m.addAttribute("haserror", true);
                m.addAttribute("error", "please check your data");
                return "index";
        }
         else {

                        try
                        {
                                System.out.println("in try");
                                userDetailDAO.adduser(userDetail);
                                return "redirect:/reg";
                        }
                        catch (Exception e)
                        {
                                m.addAttribute("userModel", userDetail);
                                m.addAttribute("regPage", true);
                                m.addAttribute("haserror", true);
                                m.addAttribute("error", "Data already present");
                                return "index";
                        }
                        }

}}