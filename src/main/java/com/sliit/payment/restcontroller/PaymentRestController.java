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
import java.util.Optional;


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



}
