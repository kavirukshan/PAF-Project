package com.sliit.paf.user.repository.custom.impl;

import com.sliit.paf.user.entity.Customer;
import com.sliit.paf.user.repository.CrudRepositoryImpl;
import com.sliit.paf.user.repository.custom.CustomerRepository;
import org.springframework.stereotype.Repository;


@Repository
public class CustomerRepositoryImpl extends CrudRepositoryImpl<Customer, String> implements CustomerRepository {

}
