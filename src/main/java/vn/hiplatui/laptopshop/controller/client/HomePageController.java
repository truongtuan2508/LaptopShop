package vn.hiplatui.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import vn.hiplatui.laptopshop.domain.User;

@Controller
public class HomePageController {

    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/index";
    }

}
