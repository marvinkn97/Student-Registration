package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.City;
import tech.csm.repo.CityRepo;

@Service
public class CityServiceImpl implements CityService {
	
	@Autowired
	private CityRepo cityRepo;

	@Override
	public List<City> getAllCitiesByStateId(Integer stateId) {
		return cityRepo.findCitiesByStateId(stateId);
	}

}
