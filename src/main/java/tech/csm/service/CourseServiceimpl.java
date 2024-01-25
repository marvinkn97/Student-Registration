package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Course;
import tech.csm.repo.CourseRepo;

@Service
public class CourseServiceimpl implements CourseService {
	
	@Autowired
	private CourseRepo  courseRepo;

	@Override
	public List<Course> getAllCourses() {
		return courseRepo.findAll();
	}

	@Override
	public Course getCourseById(Integer courseId) {
       return courseRepo.findById(courseId).get();
	}

}
