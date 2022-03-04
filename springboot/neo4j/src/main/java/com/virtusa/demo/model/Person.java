package com.virtusa.demo.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Node;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Node
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Person {
	
	@Id
	@GeneratedValue
	private Long entityId;
	
	private String name;
	
}
