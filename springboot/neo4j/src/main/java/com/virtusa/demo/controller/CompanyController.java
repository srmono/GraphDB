package com.virtusa.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.virtusa.demo.model.Company;
import com.virtusa.demo.service.CompanyService;

@RestController
@RequestMapping(value = "/api/company")
public class CompanyController {

	@Autowired
	private CompanyService service;
	
	// Get All Companies
	@GetMapping
	private List<Company> getAllCompanies() {
		return service.getCompanies();
	}
	
	// Get Company By id
	@GetMapping("/{id}")
	private Company getCompanyById(@PathVariable Long id) {
		return service.getCompanyById(id);
	}
	
	// Save Company
	@PostMapping
	private Company saveCompany(@RequestBody Company company) {
		return service.saveCompany(company);
	}
	// Update Company
	@PatchMapping("/{id}")
	private Company updateCompany(@PathVariable Long id, @RequestBody Company company) {
		return service.updateCompany(id, company);
	}
	
	// Delete Company
	@DeleteMapping("/{id}")
	private Company deleteCompany(@PathVariable Long id) {
		return service.deleteCompany(id);
	}
}
















