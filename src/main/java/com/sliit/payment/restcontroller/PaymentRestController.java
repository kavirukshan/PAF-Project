package com.sliit.payment.restcontroller;

import com.sliit.payment.beans.Payment;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;


@RestController
public class PaymentRestController {

    @RequestMapping(value = "/api/v1/items/{id}",method = RequestMethod.GET)
    public String pay(@RequestBody Payment payment, @PathVariable("id") String id){
        return "hello machan - "+payment.getDescription();
    }

}
