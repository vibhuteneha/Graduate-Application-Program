package gapp.model.dao.jpa;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.AdditionalInfo;
import gapp.model.Application;
import gapp.model.ApplicationStatus;
import gapp.model.Degree;
import gapp.model.File;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;

@Repository
public class ApplicationDaoImpl implements ApplicationDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public User getFirstNameId(String first_name) {
		return entityManager.createQuery( "from User where firstName  = :first_name", User.class )
				.setParameter("first_name", first_name)
				.getSingleResult();
	}

	@Override
	public List<Application> getApplication(Integer id) {
		return entityManager.createQuery( "from Application where applicant.id = :id order by applicant", Application.class )
				.setParameter("id", id)
				.getResultList();
	}

	@Override
	public Application getApplications(Integer id) {
		return entityManager.find( Application.class, id );
	}

	@Override
	@Transactional
	public Application saveApplication(Application application) {

		return entityManager.merge(application);
	}

	@Override
	@Transactional
	public void deleteDeg(Degree degree) {
		entityManager.remove(degree);
		
	}

	@Override
	public Degree getDegree(Integer id) {
		return entityManager.find( Degree.class, id );
	}

	@Override
	@Transactional
	public Degree saveDegree(Degree degree) {
		return entityManager.merge(degree);
	}

	@Override
	public List<AdditionalInfo> getAdditionalInfo(Integer id) {
		return entityManager.createQuery( "from AdditionalInfo where application_id = :id", AdditionalInfo.class )
	            .setParameter("id", id)
				.getResultList();
	}

	@Override
	@Transactional
	public ApplicationStatus saveAppStatus(ApplicationStatus appstatus) {
		return entityManager.merge(appstatus);
	}

	@Override
	@Transactional
	public File saveFile(File file) {
		return entityManager.merge(file);
	}

	@Override
	public File getFiles(Long fileid) {
		return entityManager
				.createQuery("from File where id=:fileid", File.class)
				.setParameter("fileid", fileid).getSingleResult();
	}

}