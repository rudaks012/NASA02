package co.Nasa.prj.service.service;

import java.util.List;

import co.Nasa.prj.comm.VO.ServiceVO;

public interface ServiceService {
	List<ServiceVO> serviceList();
	int serviceInsert(ServiceVO vo);
	ServiceVO serviceSelect(String ser_code);
	int serviceUpdate(ServiceVO vo);

	List<ServiceVO> searchListAll();
	List<ServiceVO> serviceSelectList(String s_email);
	List<ServiceVO> serviceMaxEnddateList(String s_email);
	
	ServiceVO serviceSelectMaxEnd(ServiceVO vo);
	
	int endService(ServiceVO vo);
	int schEndDateCheck();
	
	List<ServiceVO> servicePromotion(String s_email);
}
