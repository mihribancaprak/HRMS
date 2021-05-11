package kodlama.io.Hrms.business.abstracts;

import java.util.List;

import kodlama.io.Hrms.entities.concretes.JobPositions;

public interface JobPositionsService {
   
	List<JobPositions> getAll();
}
