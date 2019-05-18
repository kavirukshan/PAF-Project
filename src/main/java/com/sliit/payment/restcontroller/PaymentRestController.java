package com.sliit.payment.restcontroller;

import com.sliit.payment.beans.Payment;
import com.sliit.payment.entity.PaymentEntity;
import com.sliit.payment.services.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.ws.rs.core.MediaType;
import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping("/api/v1/payment")
public class PaymentRestController {

    @Autowired
    private PaymentService paymentService;

    @PostMapping
    public ResponseEntity savePayment(@RequestBody PaymentEntity payment){
        return ResponseEntity.ok(paymentService.save(payment));
    }

    @PutMapping
    public ResponseEntity updatePayment(@RequestBody PaymentEntity payment){
        return ResponseEntity.ok(paymentService.save(payment));
    }

    @DeleteMapping(value = "/{id}")
    public ResponseEntity delete(@PathVariable("id") Long id){
        paymentService.deleteById(id);
        return ResponseEntity.ok("Success");
    }

    @GetMapping(value = "/{id}")
    public ResponseEntity getById(@PathVariable("id") Long id){
        return ResponseEntity.ok(paymentService.findById(id));
    }

    @GetMapping
    public ResponseEntity<List<PaymentEntity>> getList(){
        return ResponseEntity.ok(paymentService.findAll());
    }

//    @RequestMapping(value = "/api/v1/payment/{id}",method = RequestMethod.GET,produces = MediaType.APPLICATION_JSON)
//    public Payment getById(@PathVariable("id") Integer id){
//        Payment payment = new Payment();
//        payment.setId(10);
//        return payment;
//    }
//
//    @RequestMapping(value = "/api/v1/payment/(id)",method = RequestMethod.PUT,consumes = MediaType.APPLICATION_JSON)
//    public String updatePayment(@RequestBody Payment payment,@PathVariable("id") String id){
//        //Update code
//        return "success";
//    }
//
//    @RequestMapping(value = "/api/v1/payment/{id}",method = RequestMethod.DELETE)
//    public String deletePayment(@PathVariable("id") Integer id){
//        //delete Code
//        return "success";
//    }
}
