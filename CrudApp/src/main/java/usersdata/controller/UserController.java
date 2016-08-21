package usersdata.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import usersdata.model.UsersEntity;
import usersdata.service.UserService;

import java.util.List;

@Controller
public class UserController {
    private UserService userService;
    private int limitResultsPerPage = 4;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "users", method = RequestMethod.GET)
    public String listUsers(@RequestParam(value="page", required = false) Integer page, Model model) {
        if (page == null)
            page = 1;
        int flag;
        int checking = page;
        List<UsersEntity> list = userService.getAllUsers(++checking, limitResultsPerPage);
        flag = (list.size() == 0) ? 0 : 1;
        model.addAttribute("flag", flag);
        model.addAttribute("listUsers", userService.getAllUsers(page, limitResultsPerPage));
        model.addAttribute("page", page);
        return "users";
    }

    @RequestMapping(value = "/useradding", method = RequestMethod.GET)
    public String listUsers1(Model model) {
        model.addAttribute("user", new UsersEntity());
        return "useradding";
    }


    @RequestMapping(value = "/useradding/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") UsersEntity user) {
        if (user.getId() == 0) {
            userService.addUser(user);
        } else {
            userService.updateUser(user);
        }

        return "redirect:/index.jsp";
    }

    @RequestMapping(value = "/usersearching", method = RequestMethod.GET)
    public String searchUsers(Model model) {
        model.addAttribute("searcheduser", new UsersEntity());
        return "usersearching";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id) {
        userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping("/userediting/{id}")
    public String editUser(@PathVariable("id") int id, Model model)
    {
        model.addAttribute("user", userService.getUserById(id));
        return "userediting";
    }

    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping(value="searchresults", method = RequestMethod.POST)
    public String searchResults(@ModelAttribute("searcheduser") UsersEntity user, Model model) {
        List<UsersEntity> searchResult;
        searchResult = userService.getUsersByName(user.getName());
        model.addAttribute("listUsers", searchResult);
        return "searchresults";
    }

}
