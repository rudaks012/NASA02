package co.Nasa.prj.service.service;

import java.util.List;

import co.Nasa.prj.comm.VO.ServiceVO;

public interface ServiceService {
	List<ServiceVO> serviceList();
	int serviceInsert(ServiceVO vo);
}
