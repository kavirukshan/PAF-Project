package com.sliit.payment.impl;

import com.sliit.payment.entity.PaymentEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

@Component
@Service
public interface PaymentImpl extends JpaRepository<PaymentEntity, Long> {

}
