package com.sliit.payment.services;

import com.sliit.payment.entity.PaymentEntity;
import com.sliit.payment.impl.PaymentImpl;

import lombok.RequiredArgsConstructor;
import org.jvnet.hk2.annotations.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;


@Service
@Component
@RequiredArgsConstructor
public class PaymentService {

    @Autowired
    private PaymentImpl paymentImpl;

    public List<PaymentEntity> findAll() {
        return paymentImpl.findAll();
    }

    public Optional<PaymentEntity>  findById(Long id) {
        return paymentImpl.findById(id);
    }

    public PaymentEntity save(PaymentEntity stock) {
        return paymentImpl.save(stock);
    }

    public void deleteById(Long id) {
        paymentImpl.deleteById(id);
    }
}
