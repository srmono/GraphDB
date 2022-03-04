package com.virtusa.demo.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.virtusa.demo.repository.CompnayRepository;
import com.virtusa.demo.repository.PersonRepository;
import com.virtusa.demo.model.Company;
import com.virtusa.demo.model.Person;

@Service
public class CompanyService {

	@Autowired
	private CompnayRepository companyReposrity;
	
	@Autowired
	PersonRepository personRepository;
	
	//get all companies
	public List<Company> getCompanies() {
		return (List<Company>)  companyReposrity.findAll();
	}
	
	//Save Company
	public Company saveCompany(Company company){
		return companyReposrity.save(company);
	}
	
	//Delete Company
	public Company deleteCompany(Long id) {
		Optional<Company> company = companyReposrity.findById(id);
		companyReposrity.deleteById(id);
		Set<Person> persons = company.get().getPersons();
		persons.forEach(person -> {
			personRepository.deleteById(person.getEntityId());
		});
		return company.get();
	}
	
	//Get company by id
	public Company getCompanyById(Long id) {
		Optional<Company> company = companyReposrity.findById(id);
		return company.get();
	}
	
	//update company 
	public Company updateCompany(Long id, Company company) {
		Optional<Company> companyOpt = companyReposrity.findById(id);
		Company companyEntity = companyOpt.get();
		updateCompanyEntity(company, companyEntity);
		return companyReposrity.save(companyEntity);
	}
	
	//update company entity
	public void updateCompanyEntity(Company request, Company companyEntity) {
		if(request.getName() != null && !request.getName().isEmpty()) {
			companyEntity.setName(request.getName());
		}
		if(request.getLocation() != null && !request.getLocation().isEmpty()) {
			companyEntity.setLocation(request.getLocation());
		}
		if(request.getPersons() != null && !request.getPersons().isEmpty()) {
			Set<Person> persons = new HashSet<>();
			persons.addAll(companyEntity.getPersons());
			persons.addAll(request.getPersons());
			companyEntity.setPersons(persons);
		}
	}
	
	
}
