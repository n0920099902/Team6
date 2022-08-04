package com.ispan.springbootdemo_teacher.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long>{
	
	@Query("from Customer where name = :name")
	public List<Customer> findCustomerByName(@Param("name") String name);
	
	@Query(value="select * from customer where name = :name", nativeQuery = true)
	public List<Customer> findCustomerByName2(@Param("name") String name);
	
//	@Transactional(readOnly = true)
	@Transactional // 蓋掉上方交易預設設定
	@Modifying
	@Query(value="delete from customer where name = :name", nativeQuery = true)
	public void deleteByName(@Param("name") String name);
	
	public List<Customer> findByLevelOrderByName(Integer level);
	
	public List<Customer> findByLevelGreaterThan(Integer level);

}
