package com.example.dkmh.controller;

import com.example.dkmh.entity.Subjects;
import com.example.dkmh.entity.Users;
import com.example.dkmh.service.SubjectService;
import com.example.dkmh.service.UserService;
import com.example.dkmh.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class HomeController {

    @Autowired
    private SubjectService subjectService;

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String homePage(Model model, Principal principal) {
        String name = principal.getName();
        Users user = userService.findByUsername(name);
        List<Subjects> listSubjects =  subjectService.getAll();
        model.addAttribute("name",user.getFullName());
        model.addAttribute("listSubjects",listSubjects);
        return "index";
    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {

        if (principal != null) {
            User loggedInUser = (User) ((Authentication) principal).getPrincipal();

            String userInfo = WebUtils.toString(loggedInUser);

            model.addAttribute("userInfo", userInfo);

            String message = "Hi " + principal.getName() //
                    + "<br> You do not have permission to access this page!";
            model.addAttribute("message", message);

        }
        return "403Page";
    }


}
