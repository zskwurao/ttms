package com.zsk.service.impl;

import com.zsk.dao.EmployeeMapper;
import com.zsk.pojo.Employee;
import com.zsk.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;
    @Override
    public Employee login(Employee employee) {
        return employeeMapper.login(employee);
    }
}
