package com.sliit.paf.user.service.custom;



import com.sliit.paf.user.dto.CustomerDTO;
import com.sliit.paf.user.service.SuperService;

import java.util.List;

public interface ManageCustomersService extends SuperService {

    List<CustomerDTO> getCustomers();

    void createCustomer(CustomerDTO dto);

    void updateCustomer(CustomerDTO dto);

    void deleteCustomer(String customerID);

    CustomerDTO findCustomer(String id);


}
