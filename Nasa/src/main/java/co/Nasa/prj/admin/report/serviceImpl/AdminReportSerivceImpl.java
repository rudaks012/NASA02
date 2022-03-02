package co.Nasa.prj.admin.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Nasa.prj.admin.report.service.AdminReportMapper;
import co.Nasa.prj.admin.report.service.AdminReportService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.ReportVO;

@Repository("reportDao")
public class AdminReportSerivceImpl implements AdminReportService {

	@Autowired
	AdminReportMapper map;

	
	@Override
	public int totalReport() {
		// TODO Auto-generated method stub
		return map.totalReport();
	}

	@Override
	public List<ReportVO> getReportListWithPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return map.getReportListWithPaging(cri);
	}

	@Override
	public AdminAuthorVO detailedReport(AdminAuthorVO vo) {
		// TODO Auto-generated method stub
		return map.detailedReport(vo);
	}

	




	
}
