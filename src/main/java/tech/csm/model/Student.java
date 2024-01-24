package tech.csm.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.PastOrPresent;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "t_student_master")
public class Student implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2589052921156585588L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "roll_no")
	private Integer rollNo;

	@NotBlank(message ="Name cannot be blank")
	private String name;

	@Email(message = "Email not valid")
	private String email;

	@Column(name = "dob")
	@PastOrPresent(message = "Date cannot be a future date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfBirth;

	@Min(value = 0, message = "Not Less than 0")
	@Max(value = 10, message = "Less than 10")
	private Double cgpa;

	@Column(name = "yroa")
	private Integer yearOfAdmission;

	@ManyToOne
	@JoinColumn(name = "branch_id")
	private Branch branch;
	
	@OneToMany(mappedBy = "student", cascade = CascadeType.ALL)
    private List<Address> adresses;

}
