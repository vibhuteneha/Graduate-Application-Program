package gapp.model.dao;

import java.util.List;

import gapp.model.AdditionalInfo;
import gapp.model.Application;
import gapp.model.ApplicationStatus;
import gapp.model.Degree;
import gapp.model.File;
import gapp.model.User;


public interface ApplicationDao {
	
	User getFirstNameId( String first_name );
	
	//--------------View Applications----------------------
	List<Application> getApplication(Integer id);
	
	Application getApplications(Integer id);
	
	
	//-------------Adding Application-----------------------
	
	Application saveApplication( Application application );
	
	//-------------Degree--------------------------------------
	
	Degree getDegree( Integer id );
	
	Degree saveDegree( Degree degree );
	
	//---------------Delete Degree----------------------------
	
	void deleteDeg ( Degree degree );
	
	//----------------Additional Info--------------------------
	
	List<AdditionalInfo> getAdditionalInfo(Integer id);
	
	//----------------Application Status------------------------
	
	ApplicationStatus saveAppStatus (ApplicationStatus appstatus);

	//-----------------File operations-----------------------------
	
	File saveFile(File file);

	File getFiles(Long id);
}

