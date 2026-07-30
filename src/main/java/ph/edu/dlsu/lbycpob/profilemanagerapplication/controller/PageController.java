package ph.edu.dlsu.lbycpob.profilemanagerapplication.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class PageController {
    @GetMapping("/")
    public String index() {
        return "index";
    }
}

