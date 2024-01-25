package tech.csm.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.ServletResponse;
import tech.csm.model.City;
import tech.csm.model.Course;
import tech.csm.model.Student;
import tech.csm.service.BranchService;
import tech.csm.service.CityService;
import tech.csm.service.CourseService;
import tech.csm.service.StateService;
import tech.csm.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private BranchService branchService;

	@Autowired
	private StateService stateService;

	@Autowired
	private CityService cityService;

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private StudentService studentService;

	@GetMapping("/")
	public String redirectToForm() {
		return "redirect:/getform";
	}

	@GetMapping("/getform")
	public String getRegistrationForm(Model model) {
		
		String yearStr = new SimpleDateFormat("yyyy").format(new Date());
		
		Integer year = Integer.parseInt(yearStr);
		
//		System.out.println(year);
		
		List<Integer> yearList = new ArrayList<>();
		
		for(int i=0; i<4; i++) {
			yearList.add(year-i);
		}
		
		model.addAttribute("branches", branchService.getAllBranches());
		model.addAttribute("states", stateService.getAllStates());
		model.addAttribute("courses", courseService.getAllCourses());
		model.addAttribute("years", yearList);
		model.addAttribute("students", studentService.getAllStudents());
		return "studentregForm";
	}

	@GetMapping("/getCitiesByState")
	public void getCitiesByState(@RequestParam("stateId") Integer stateId, ServletResponse servletResponse) {
		servletResponse.setContentType("text/html");

		List<City> cities = cityService.getAllCitiesByStateId(stateId);
		String response = "<option value='0'>--select--</option>";
		for (City c : cities) {
			response += "<option value='" + c.getCityId() + "'>" + c.getCityName() + "</option>";
		}

		System.out.println(response);
		try {
			servletResponse.getWriter().println(response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@GetMapping("/getCourseFee")
	public void getCourseFee(@RequestParam("courseId") Integer courseId, ServletResponse servletResponse) {
		servletResponse.setContentType("text/plain");
		Course course = courseService.getCourseById(courseId);
		try {
			servletResponse.getWriter().println(course.getFees());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@PostMapping("/registerStudent")
	public String registerStudent(@ModelAttribute Student student, RedirectAttributes redirectAttributes) {
		
		String msg = studentService.registerStudent(student);
		redirectAttributes.addFlashAttribute("msg", msg);
				
		return "redirect:./getform";
		
	}

}
