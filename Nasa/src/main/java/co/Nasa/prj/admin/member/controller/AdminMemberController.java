package co.Nasa.prj.admin.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Nasa.prj.admin.member.service.AdminMemberService;
import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.admin.service.PageDTO;
import co.Nasa.prj.comm.VO.BuyerVO;

@Controller
public class AdminMemberController {

	@Autowired
	AdminMemberService memberDao;
	
	static Logger logger = Logger.getLogger("co.Nasa.prj.admin.member.controller");
	
	@RequestMapping("/go_admin.do")
	public String go_admin(Criteria cri,Model model) {
//		model.addAttribute("buyerList", memberDao.buyerList());
		model.addAttribute("buyerList",memberDao.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, memberDao.getBuyerTotal()));
		model.addAttribute("totalBuyer",memberDao.getBuyerTotal());
		return "admin/member/manageBuyer";
	}
	
	@ResponseBody
	@PostMapping("/ajaxSelectMember.do")
	public Map<String, Object> ajaxSelectMember( AdminAuthorVO vo,Criteria cri) {
		String result="N";
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		vo = memberDao.selectBuyer(vo.getB_email()); //구매자 상세정보
		System.out.println(vo);
		List<AdminAuthorVO> payment= memberDao.selectBuyerPayment(cri); //구매자 결제내역
		PageDTO paging= new PageDTO(cri, memberDao.getSellerTotal());
		map.put("buyer", vo);
		map.put("payment", payment);
		map.put("paging", paging);
		if(vo !=null) {
			map.put("result", result);
		}
		return map;
	}
	//주석달기
	@RequestMapping("/manage_seller.do")
	public String manage_seller(Model model) {
		model.addAttribute("sellerList", memberDao.sellerList());
		model.addAttribute("totalSeller", memberDao.getSellerTotal());
		return "admin/member/manageSeller";
	}
	
	@ResponseBody
	@PostMapping("/ajaxUpdateMemberRank.do")
	public String ajaxUpdateMemberRank() {
		String result="N";		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/ajaxBuyerPayment.do")
	public List<AdminAuthorVO> ajaxBuyerPayment(Criteria cri) {
		return memberDao.selectBuyerPayment(cri);
	}
	
	@ResponseBody
	@PostMapping("/ajaxUpdateBuyerRank.do")
	public int ajaxUpdateBuyerRank(BuyerVO vo) {
		int n=memberDao.updateMemberRank(vo);
		return n;
	}
}
