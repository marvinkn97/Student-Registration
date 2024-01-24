package tech.csm.service;

import java.util.List;

import tech.csm.model.City;

public interface CityService {
	List<City> getAllCitiesByStateId(Integer stateId);

}
