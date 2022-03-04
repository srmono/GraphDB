package com.virtusa.demo.repository;

import org.springframework.data.neo4j.repository.Neo4jRepository;

import com.virtusa.demo.model.Person;

public interface PersonRepository extends Neo4jRepository<Person, Long> {

}
