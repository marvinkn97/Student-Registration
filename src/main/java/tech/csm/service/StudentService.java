package tech.csm.service;

import java.util.List;

import tech.csm.model.Student;

public interface StudentService {
	
	String registerStudent(Student student);
	List<Student> getAllStudents();
}
