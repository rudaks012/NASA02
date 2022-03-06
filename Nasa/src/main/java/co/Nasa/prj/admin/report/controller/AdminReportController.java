package co.Nasa.prj.admin.report.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.admin.report.service.AdminReportService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.admin.service.PageDTO;
import co.Nasa.prj.comm.VO.ReportVO;

@Controller
public class AdminReportController {
	@Autowired
	AdminReportService reportDao;
	
	//전체신고
	@RequestMapping("/report_inquiry.do")
	public String report_inquiry(Model model,Criteria cri) {
		System.out.println(cri);
		model.addAttribute("reportLists", reportDao.getReportListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, reportDao.totalReport()));
		model.addAttribute("total", reportDao.totalReport());
	
		return"admin/report/reportInquiry";
	}
	
	//신고상세조회
	@ResponseBody
	@PostMapping("/ajaxDetailedReport.do")
	public ReportVO ajaxDetailedReport(ReportVO vo) {
		
		return reportDao.detailedReport(vo);
	}
	
	//신고반려
	@ResponseBody
	@PostMapping("/ajaxUpdateDeniedReport.do")
	public int updateDeniedReport(ReportVO vo) {
		int n=reportDao.updateDeniedReport(vo);
		return n;
	}
	
	//신고승인
	@ResponseBody
	@PostMapping("/updateConfirmReport.do")
	public Map<String, Object> updateConfirmReport(@RequestBody ReportVO vo,HttpServletRequest response){
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("p_id",vo.getEmail());
		map.put("p_code",vo.getRe_code());
		map.put("result", "");
		
		reportDao.updateConfirmReport(map);
		return map;
	}
	
	
	//신고대기
	@RequestMapping("/report_wait.do")
	public String report_wait(Model model,Criteria cri) {
		model.addAttribute("reportWaitLists", reportDao.getReportWaitListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, reportDao.totalReportWait()));
		model.addAttribute("total",reportDao.totalReportWait() );
		
		return"admin/report/reportWait";
	}
	
	//신고대기 상세조회 ajax
	@ResponseBody
	@RequestMapping("/ajaxDetailedReportWait.do")
	public ReportVO ajaxDetailedReportWait(ReportVO vo) {
		return reportDao.detailedReport(vo);
	}
	
	//신고대기->Y 추후수정
	@ResponseBody
	@RequestMapping("/ajaxConfirmReport.do")
	public int ajaxConfirmReport(AdminAuthorVO vo) {
		int n= reportDao.updateReportResult(vo);
		return n;
	}
	
	//신고승인 페이지
	@RequestMapping("/report_complete.do")
	public String report_complete(Model model,Criteria cri) {
		
		model.addAttribute("reportCompleteLists", reportDao.getReportListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, reportDao.totalReportComplete()));
		model.addAttribute("total",reportDao.totalReportComplete() );
		return"admin/report/reportComplete";
	}
	
	
	@ResponseBody
	@PostMapping("/ajaxDetailedReportComplete.do")
	public ReportVO ajaxDetailedReportComplete(ReportVO vo) {
		return reportDao.detailedReport(vo);
	}
	
	@RequestMapping("/report_refuse.do")
	public String report_refuse(Model model,Criteria cri) {
		
		model.addAttribute("reportRefuseLists", reportDao.getReportRefuseListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, reportDao.totalReportRefuse()));
		model.addAttribute("total",reportDao.totalReportRefuse() );
		return"admin/report/reportRefuse";
	}
	
	
}
