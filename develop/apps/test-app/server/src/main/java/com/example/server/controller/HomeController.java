package com.example.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping({"/{path:[^\\.]*}", "/error"})
    public String index() {
        return "forward:/";
    }
}
