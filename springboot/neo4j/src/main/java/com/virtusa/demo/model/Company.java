package com.virtusa.demo.model;

import java.util.Set;

import org.springframework.data.annotation.Id;
import org.springframework.data.neo4j.core.schema.GeneratedValue;
import org.springframework.data.neo4j.core.schema.Node;
import org.springframework.data.neo4j.core.schema.Relationship;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Node
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Company {
	
	@Id
	@GeneratedValue
	private Long entityId;
	
	private String name;
	private String location;
	
	@Relationship(type="WORKS_FOR", direction = Relationship.Direction.INCOMING )
	private Set<Person>  persons;
	
	
}
