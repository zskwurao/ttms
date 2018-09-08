package com.zsk.dao;

import com.zsk.pojo.Employee;
import org.springframework.stereotype.Repository;

@Repository
public interface EmployeeMapper {

    public Employee login(Employee employee);
}
