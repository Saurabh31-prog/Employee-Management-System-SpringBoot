//package com.saurabh.ems;
//
//import org.junit.jupiter.api.Test;
//import org.springframework.boot.test.context.SpringBootTest;
//
//@SpringBootTest
//class EmployeeManagementSystemApplicationTests {
//
//	@Test
//	void contextLoads() {
//	}
//
//}

package com.saurabh.ems;

import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@EnableAutoConfiguration(exclude = {DataSourceAutoConfiguration.class})
class EmployeeManagementSystemApplicationTests {

    @Test
    void contextLoads() {
        // This test will no longer try to connect to MySQL
    }
}

