package com.sliit.payment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class PaymentController {

    @RequestMapping(value = "/payment")
    public String payment(){
        return "payment";
    }
}
