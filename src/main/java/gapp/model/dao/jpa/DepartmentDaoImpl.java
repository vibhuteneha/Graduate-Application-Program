package gapp.model.dao.jpa;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.AdditionalInfo;
import gapp.model.Department;
import gapp.model.Program;
import gapp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Department> getDepartment()
    {
        return entityManager.createQuery( "from Department order by id", Department.class )
            .getResultList();
    }

	@Override
	public Department getDepartment(Integer id) {
		return entityManager.find( Department.class, id );
	}

	@Override
	public List<Program> getProgram(Integer id) {
		return entityManager.createQuery( "from Program where departments_id = :id", Program.class )
	            .setParameter("id", id)
				.getResultList();
	}
	
	@Override
	public Program getPrograms(Integer id) {
		return entityManager.find( Program.class, id );
	}


	@Override
	public List<AdditionalInfo> getAdditionalInfo(Integer id) {
		return entityManager.createQuery( "from AdditionalInfo where departments_id = :id", AdditionalInfo.class )
	            .setParameter("id", id)
				.getResultList();
	}
	
	@Override
	public AdditionalInfo getAdditional(Integer id) {
		return entityManager.find( AdditionalInfo.class, id);
	}

	@Override
	@Transactional
	public Department saveDepartment(Department department) {
		
		return entityManager.merge(department);
	}

	@Override
	@Transactional
	public Program saveProgram(Program program) {
		
		return entityManager.merge(program);
	}  
	
	@Override
	@Transactional
	public AdditionalInfo saveAdditionalInfo(AdditionalInfo addinfo) {
		
		return entityManager.merge(addinfo);
	}

	@Override
	@Transactional
	public void deleteProg(Program program) {
		entityManager.remove(program);
		
	}

	@Override
	@Transactional
	public void deleteAddinfo(AdditionalInfo addinfo) {
		entityManager.remove(addinfo);
		
	}

	@Override
	public List<Program> getProgram() {
		return entityManager.createQuery( "from Program order by id", Program.class )
	            .getResultList();
	}
}