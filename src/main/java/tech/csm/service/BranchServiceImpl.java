package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Branch;
import tech.csm.repo.BranchRepo;

@Service
public class BranchServiceImpl implements BranchService {
	
	@Autowired
	private BranchRepo branchRepo;

	@Override
	public List<Branch> getAllBranches() {
		return branchRepo.findAll();
	}

}
