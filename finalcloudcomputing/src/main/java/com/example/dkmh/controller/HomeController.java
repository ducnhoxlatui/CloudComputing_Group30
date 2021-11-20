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
        Users userupdate = userService.findByUsername(name);
        List<Subjects> listSubjects =  subjectService.getAll();
        model.addAttribute("name",userupdate.getFullName());
        model.addAttribute("listSubjects",listSubjects);
        return "index";
    }

    @GetMapping("/registersubjects")
    public String registerSubject(Model model,@Param("keyword") String keyword, Principal principal) {
        User loginedUser = (User) ((Authentication) principal).getPrincipal();
        String userInfo = WebUtils.toStringUser(loginedUser);
        Users userupdate = userService.findByUsername(userInfo);
        Set<Subjects> subject = userupdate.getSubject();
        String name = principal.getName();
        List<Subjects> listSubjects ;
        List<Subjects> list = new ArrayList<>();
        Users user = userService.findByUsername(name);
        if(keyword != null) {
            listSubjects =  subjectService.getSubjects(keyword);
            for(Subjects s : listSubjects) {
                if(!subject.contains(s)) {
                    list.add(s);
                }
            }
        }
        else {
            listSubjects =  subjectService.getAll();
            for(Subjects s : listSubjects) {
                if(!subject.contains(s)) {
                    list.add(s);
                }
            }
        }
        model.addAttribute("name",userupdate.getFullName());
        model.addAttribute("listdk",subject);
        model.addAttribute("listSubjects",list);
        model.addAttribute("keyword",keyword);
        return "dkngoaict";
    }


    @PostMapping("/registersubjects")
    public String getSubjectByName(Model model, @Param("keyword") String keyword, Principal principal ) {
        User loginedUser = (User) ((Authentication) principal).getPrincipal();
        String userInfo = WebUtils.toStringUser(loginedUser);
        Users userupdate = userService.findByUsername(userInfo);
        Set<Subjects> subject = userupdate.getSubject();
        String name = principal.getName();
        List<Subjects> list = new ArrayList<>();
        List<Subjects> listSubjects ;
        if(keyword != null) {
            listSubjects =  subjectService.getSubjects(keyword);
            for(Subjects s : listSubjects) {
                if(!subject.contains(s)) {
                    list.add(s);
                }
            }
        }
        else {
            listSubjects =  subjectService.getAll();
            for(Subjects s : listSubjects) {
                if(!subject.contains(s)) {
                    list.add(s);
                }
            }
        }
        Users user = userService.findByUsername(name);
        model.addAttribute("name",userupdate.getFullName());
        model.addAttribute("listdk",subject);
        model.addAttribute("listSubjects",list);
        model.addAttribute("keyword",keyword);
        return "dkngoaict";
    }



    @GetMapping("/registersubjects/{id}")
    public RedirectView addSubject(Model model,@PathVariable Integer id, Principal principal ) {
        Integer Id = id;
        System.out.println(id);
        User loginedUser = (User) ((Authentication) principal).getPrincipal();
        String userInfo = WebUtils.toStringUser(loginedUser);
        Users userupdate = userService.findByUsername(userInfo);
        Set<Subjects> subject = userupdate.getSubject();
        subject.add(subjectService.getSubjectsById(id));
        userupdate.setSubject(subject);
        userService.save(userupdate);
        return new RedirectView("/registersubjects");

    }
    @GetMapping("registersubjects/delete/{id}")
    public RedirectView deleteSubject(Model model,@PathVariable Integer id, Principal principal) {
        User loginedUser = (User) ((Authentication) principal).getPrincipal();
        String userInfo = WebUtils.toStringUser(loginedUser);
        Users userupdate = userService.findByUsername(userInfo);
        Set<Subjects> subject = userupdate.getSubject();
        subject.remove(subjectService.getSubjectsById(id));
        userupdate.setSubject(subject);
        userService.save(userupdate);
        return new RedirectView("/registersubjects");
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(Model model, Principal principal) {

        User loginedUser = (User) ((Authentication) principal).getPrincipal();

        String userInfo = WebUtils.toString(loginedUser);
        model.addAttribute("userInfo", userInfo);

        return "adminPage";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(Model model) {

        return "loginPage";
    }

    @RequestMapping(value = "/result", method = RequestMethod.GET)
    public String getResult(Model model, Principal principal){
        User loginedUser = (User) ((Authentication) principal).getPrincipal();
        String userInfo = WebUtils.toStringUser(loginedUser);
        Users userupdate = userService.findByUsername(userInfo);
        Set<Subjects> subject = userupdate.getSubject();
        String name = principal.getName();
        Users user = userService.findByUsername(name);
        model.addAttribute("name",userupdate.getFullName());
        model.addAttribute("listdk",subject);
        return "resultdk";

    }


    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String accessDenied(Model model, Principal principal) {

        if (principal != null) {
            User loginedUser = (User) ((Authentication) principal).getPrincipal();

            String userInfo = WebUtils.toString(loginedUser);

            model.addAttribute("userInfo", userInfo);

            String message = "Hi " + principal.getName() //
                    + "<br> You do not have permission to access this page!";
            model.addAttribute("message", message);

        }

        return "403Page";
    }


}
