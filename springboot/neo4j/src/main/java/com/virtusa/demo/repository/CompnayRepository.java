package com.virtusa.demo.repository;

import org.springframework.data.neo4j.repository.Neo4jRepository;

import com.virtusa.demo.model.Company;

public interface CompnayRepository extends Neo4jRepository<Company, Long> {

	
}
