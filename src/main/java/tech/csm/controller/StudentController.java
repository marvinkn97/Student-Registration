package tech.csm.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.ServletResponse;
import tech.csm.model.City;
import tech.csm.service.BranchService;
import tech.csm.service.CityService;
import tech.csm.service.StateService;

@Controller
public class StudentController {
	
	@Autowired
	private BranchService branchService;
	
	@Autowired
	private StateService  stateService;
	
	@Autowired
	private CityService cityService;
	
	@GetMapping("/")
	public String redirectToForm() {
		return "redirect:/getform";
	}
	
	@GetMapping("/getform")
	public String getRegistrationForm(Model model) {
		model.addAttribute("branches", branchService.getAllBranches());
		model.addAttribute("states", stateService.getAllStates());
		return "studentregForm";
	}
	
	@GetMapping("/getCitiesByState")
	public void getCitiesByState(@RequestParam("stateId") Integer stateId, ServletResponse servletResponse) {
		servletResponse.setContentType("text/html");
		
		List<City> cities = cityService.getAllCitiesByStateId(stateId);
		String response = "<option value='0'>--select--</option>";
		for(City c : cities) {
			response += "<option value='"+c.getCityId()+"'>"+c.getCityName()+"</option>";
		}
		
		System.out.println(response);
		try {
			servletResponse.getWriter().println(response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
