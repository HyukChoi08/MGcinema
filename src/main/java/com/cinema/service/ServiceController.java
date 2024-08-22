package com.cinema.service;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ServiceController {

    @GetMapping("/serviceHome")
    public String getServiceHome(@RequestParam(value = "id", defaultValue = "1") int id, Model model) {
        ServiceHomeDTO serviceHome = new ServiceHomeDTO("고객센터", "아직아직아직");
        model.addAttribute("serviceHome", serviceHome);
        return "service/ServiceHome;
    }
}
