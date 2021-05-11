package kodlama.io.Hrms.business.concretes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kodlama.io.Hrms.business.abstracts.JobPositionsService;
import kodlama.io.Hrms.dataAccess.abstracts.JobPositionsDao;
import kodlama.io.Hrms.entities.concretes.JobPositions;

@Service
public class JobPositionsManager implements JobPositionsService {
  
	private JobPositionsDao jobPositionsDao;
	
	@Autowired
	public JobPositionsManager(JobPositionsDao jobPositionsDao) {
		super();
		this.jobPositionsDao = jobPositionsDao;
	}

	@Override
	public List<JobPositions> getAll() {
		
		return this.jobPositionsDao.findAll();
	}

}
