package co.Nasa.prj.admin.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.AdminServiceMapper;
import co.Nasa.prj.admin.service.AdminServiceService;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.ServiceVO;


@Repository("adminServiceDao")
public class AdminServiceImpl implements AdminServiceService {

	@Autowired AdminServiceMapper map;

	@Override
	public List<ServiceVO> getServiceListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getServiceListWithPaging(cri);
	}

	@Override
	public int getTotalService(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getTotalService(cri);
	}

	@Override
	public AdminAuthorVO detailedService(AdminAuthorVO vo) {
		// TODO Auto-generated method stub
		return map.detailedService(vo);
	}
	
	
}