package co.Nasa.prj.buyer.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
import java.util.List;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Nasa.prj.buyer.service.BuyerMapper;
import co.Nasa.prj.category.service.CategoryMapper;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.CategoryVO;
import co.Nasa.prj.comm.VO.CouponVO;
import co.Nasa.prj.comm.VO.PagingDTO;
import co.Nasa.prj.comm.VO.PaymentVO;
import co.Nasa.prj.comm.VO.ReportVO;
import co.Nasa.prj.comm.VO.ReviewVO;
import co.Nasa.prj.comm.VO.Review_CommentVO;
import co.Nasa.prj.comm.VO.SellerVO;
import co.Nasa.prj.comm.VO.SubCategoryVO;
import co.Nasa.prj.comm.VO.WishlistVO;
import co.Nasa.prj.coupon.service.CouponMapper;
import co.Nasa.prj.payment.service.PaymentMapper;
import co.Nasa.prj.report.service.ReportMapper;
import co.Nasa.prj.review.service.ReviewMapper;
import co.Nasa.prj.review_comment.service.Review_CommentMapper;
import co.Nasa.prj.seller.service.SellerMapper;
import co.Nasa.prj.sub_category.service.Sub_CategoryMapper;
import co.Nasa.prj.wishlist.service.WishlistMapper;

@Controller
public class BuyerController {
	@Autowired
	BuyerMapper buyerDao;
	@Autowired
	CategoryMapper categoryDao;
	@Autowired
	Sub_CategoryMapper sub_categoryDao;
	@Autowired
	ReportMapper reportDao;
	@Autowired
	PaymentMapper paymentDao;
	@Autowired
	CouponMapper couponDao;
	@Autowired
	ReviewMapper reviewDao;
	@Autowired
	Review_CommentMapper review_commentDao;
	@Autowired
	WishlistMapper wishlistDao;
	@Autowired
	SellerMapper sellerDao;
	
	//????????????????????? ?????????
//	@Autowired
//	private PasswordEncoder passwordEncoder;

	@Value("#{upload['profileupload']}")
	private String profileupload;
	
	// ????????? ?????????????????? ??????
	@RequestMapping("/goBuyerMypage.do")
	public String goBuyerMypage(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			Model model) {
		System.out.println("??????!!!!!!!!!!!!!!!!!!!!!!!! : "+(String) session.getAttribute("author"));
		// ????????? VO
		BuyerVO vo = new BuyerVO();
		CategoryVO cvo = new CategoryVO();
		SubCategoryVO scvo = new SubCategoryVO();
		
		// ?????????????????? ????????? ?????? ??????
		vo.setB_email((String) session.getAttribute("id"));
		vo = buyerDao.selectBuyer(vo);
		
		// ?????????????????? ?????? ???????????? ?????? ??????(????????? ???????????? ?????? ????????? ???????????????????????? ????????? ?????? VO ???????????????)
		if(vo.getField_code() == null) {
			model.addAttribute("categoryName", "?????????");
			model.addAttribute("subcategoryName", "?????????????????? ?????? ??????");
		} else {
			scvo.setSub_no(vo.getField_code());
			scvo = sub_categoryDao.selectSub_category(scvo);
			
			cvo.setCat_no(scvo.getCat_no());
			cvo = categoryDao.selectCategory(cvo);
			
			String categoryName = cvo.getCat_name();
			String subcategoryName = scvo.getSub_name();

			model.addAttribute("categoryName", categoryName);
			model.addAttribute("subcategoryName", subcategoryName);
		}
		
		// ??????
		model.addAttribute("buyerinfo", vo);
		
		return "buyer/buyerMypage";
	}

	@RequestMapping("/deleteBuyer.do")
	@ResponseBody
	public String deleteBuyer(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, @Param("dPassword") String dPassword, BCryptPasswordEncoder passwordEncoder) {
		// ??? ??????????????? ??????
		System.out.println(dPassword);

		// ?????? ?????? status
		String deleteStatus = "codeD";

		// vo ??????
		PaymentVO paymentvo = new PaymentVO();
		BuyerVO buyervo = new BuyerVO();

		// vo ??? ?????? ???????????? buyer ?????? ??????
		paymentvo.setB_email((String) session.getAttribute("id"));
		buyervo.setB_email((String) session.getAttribute("id"));

		// ?????? ?????? ??????
		List<PaymentVO> paymentDList = paymentDao.buyerPaymentList(paymentvo);
		buyervo = buyerDao.selectBuyer(buyervo);

		// ?????? ?????? ??????
		// 1. ????????? ??????????????? ???????????????? !buyervo.getB_password().equals(dPassword)
		if (!passwordEncoder.matches(dPassword, buyervo.getB_password())) {
			System.out.println(buyervo.getB_password());
			deleteStatus = "codeP";
			return deleteStatus;
		}

		// 2. ?????? ???????????? ???????????? ??????????
		for (int i = 0; i < paymentDList.size(); i++) {
			if (paymentDList.get(i).getPay_enddate() == null) {
				deleteStatus = "codeS";
				return deleteStatus;
			}
		}

		// ???????????? ???????????? ????????? delete
		buyerDao.deleteBuyer(buyervo);

		return deleteStatus;
	}

	// ???????????? ???????????? ??????
	@RequestMapping("/reportHistory.do")
	public String reportHistory(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, PagingDTO pagingdto) {
		ReportVO vo = new ReportVO();
		vo.setRe_reporter((String) session.getAttribute("id"));
		//List<ReportVO> reportList = reportDao.selectBuyerReportList(vo);
		vo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ReportVO> reportList = reportDao.selectPagingBuyerReportList(vo);
		pagingdto.setTotal(reportDao.countPagingBuyerReport(vo));

		model.addAttribute("reportList", reportList);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));

		return "buyer/reportHistory";
	}

	// ???????????? ???????????? ??????
	@RequestMapping("/buyHistory.do")
	public String buyHistory(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, PagingDTO pagingdto) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		model.addAttribute("buyerinfo", buyervo);

		PaymentVO paymentvo = new PaymentVO();
		paymentvo.setB_email((String) session.getAttribute("id"));
		//List<PaymentVO> paymentList = paymentDao.buyerPaymentList(paymentvo);
		paymentvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<PaymentVO> paymentList = paymentDao.selectPagingBuyerPaymentList(paymentvo);
		List<PaymentVO> endpayList = paymentDao.endPaymentList(paymentvo);
		for(int i = 0; i < paymentList.size(); i++) {
			for(int j = 0; j < endpayList.size(); j++) {
				if(paymentList.get(i).getPay_code().equals(endpayList.get(j).getPay_code())) {
					paymentList.get(i).setEvent_end("notend");
				}
			}
		}
		pagingdto.setTotal(paymentDao.countPagingBuyerPayment(paymentvo));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("address", "buyHistory.do");
		
		PaymentVO pvo = new PaymentVO();
		pvo.setB_email((String) session.getAttribute("id"));
		List<PaymentVO> paysumList = paymentDao.buyerPaymentList(pvo);
		int paysum = 0;
		int upgrademoney = 0;
		for (int i = 0; i < paysumList.size(); i++) {
			PaymentVO pmvo = paysumList.get(i);
			if(pmvo.getPay_enddate() != null) {
				paysum += pmvo.getPay_price();
			}
		}
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		String upgrademoneyform = "";
		switch (buyervo.getB_rank()) {
			case "1":
				System.out.println("1");
				upgrademoney = 1000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "2":
				System.out.println("2");
				upgrademoney = 5000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "3":
				System.out.println("3");
				upgrademoney = 10000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "4":
				System.out.println("4");
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
		}
		
		String paysumform = formatter.format(paysum);
		model.addAttribute("paysum", paysumform);
		model.addAttribute("upgrademoney",upgrademoneyform);

		return "buyer/buyHistory";
	}
	
	

	@RequestMapping("/monthSearch.do")
	public String monthSearch(Model model, HttpSession session, HttpServletResponse response,
							  HttpServletRequest request, PagingDTO pagingdto) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		model.addAttribute("buyerinfo", buyervo);
		
		PaymentVO paymentvo = new PaymentVO();
		paymentvo.setB_email((String) session.getAttribute("id"));
		//List<PaymentVO> paymentList = paymentDao.buyerPaymentList(paymentvo);
		paymentvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<PaymentVO> paymentList = paymentDao.monthSearch(paymentvo);
		List<PaymentVO> endpayList = paymentDao.endPaymentList(paymentvo);
		for(int i = 0; i < paymentList.size(); i++) {
			for(int j = 0; j < endpayList.size(); j++) {
				if(paymentList.get(i).getPay_code().equals(endpayList.get(j).getPay_code())) {
					paymentList.get(i).setEvent_end("notend");
				}
			}
		}
		pagingdto.setTotal(paymentDao.countMonthSearch(paymentvo));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("address", "monthSearch.do");
		
		PaymentVO pvo = new PaymentVO();
		pvo.setB_email((String) session.getAttribute("id"));
		List<PaymentVO> paysumList = paymentDao.buyerPaymentList(pvo);
		int paysum = 0;
		int upgrademoney = 0;
		for (int i = 0; i < paysumList.size(); i++) {
			PaymentVO pmvo = paysumList.get(i);
			if(pmvo.getPay_enddate() != null) {
				paysum += pmvo.getPay_price();
			}
		}
		DecimalFormat formatter = new DecimalFormat("###,###");
		String upgrademoneyform = "";
		switch (buyervo.getB_rank()) {
			case "1":
				System.out.println("1");
				upgrademoney = 1000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "2":
				System.out.println("2");
				upgrademoney = 5000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "3":
				System.out.println("3");
				upgrademoney = 10000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "4":
				System.out.println("4");
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
		}
		
		String paysumform = formatter.format(paysum);
		model.addAttribute("paysum", paysumform);
		model.addAttribute("upgrademoney",upgrademoneyform);
		
		return "buyer/buyHistory";
	}
	
	@RequestMapping("/sixmonthSearch.do")
	public String sixmonthSearch(Model model, HttpSession session, HttpServletResponse response,
							  HttpServletRequest request, PagingDTO pagingdto) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		model.addAttribute("buyerinfo", buyervo);
		
		PaymentVO paymentvo = new PaymentVO();
		paymentvo.setB_email((String) session.getAttribute("id"));
		//List<PaymentVO> paymentList = paymentDao.buyerPaymentList(paymentvo);
		paymentvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<PaymentVO> paymentList = paymentDao.sixmonthSearch(paymentvo);
		List<PaymentVO> endpayList = paymentDao.endPaymentList(paymentvo);
		for(int i = 0; i < paymentList.size(); i++) {
			for(int j = 0; j < endpayList.size(); j++) {
				if(paymentList.get(i).getPay_code().equals(endpayList.get(j).getPay_code())) {
					paymentList.get(i).setEvent_end("notend");
				}
			}
		}
		pagingdto.setTotal(paymentDao.countSixmonthSearch(paymentvo));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("address", "sixmonthSearch.do");
		
		PaymentVO pvo = new PaymentVO();
		pvo.setB_email((String) session.getAttribute("id"));
		List<PaymentVO> paysumList = paymentDao.buyerPaymentList(pvo);
		int paysum = 0;
		int upgrademoney = 0;
		for (int i = 0; i < paysumList.size(); i++) {
			PaymentVO pmvo = paysumList.get(i);
			if(pmvo.getPay_enddate() != null) {
				paysum += pmvo.getPay_price();
			}
		}
		DecimalFormat formatter = new DecimalFormat("###,###");
		String upgrademoneyform = "";
		switch (buyervo.getB_rank()) {
			case "1":
				System.out.println("1");
				upgrademoney = 1000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "2":
				System.out.println("2");
				upgrademoney = 5000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "3":
				System.out.println("3");
				upgrademoney = 10000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "4":
				System.out.println("4");
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
		}
		
		String paysumform = formatter.format(paysum);
		model.addAttribute("paysum", paysumform);
		model.addAttribute("upgrademoney",upgrademoneyform);
		
		return "buyer/buyHistory";
	}
	
	@RequestMapping("/yearSearch.do")
	public String yearSearch(Model model, HttpSession session, HttpServletResponse response,
							  HttpServletRequest request, PagingDTO pagingdto) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		model.addAttribute("buyerinfo", buyervo);
		
		PaymentVO paymentvo = new PaymentVO();
		paymentvo.setB_email((String) session.getAttribute("id"));
		//List<PaymentVO> paymentList = paymentDao.buyerPaymentList(paymentvo);
		paymentvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<PaymentVO> paymentList = paymentDao.yearSearch(paymentvo);
		List<PaymentVO> endpayList = paymentDao.endPaymentList(paymentvo);
		for(int i = 0; i < paymentList.size(); i++) {
			for(int j = 0; j < endpayList.size(); j++) {
				if(paymentList.get(i).getPay_code().equals(endpayList.get(j).getPay_code())) {
					paymentList.get(i).setEvent_end("notend");
				}
			}
		}
		pagingdto.setTotal(paymentDao.countYearSearch(paymentvo));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("address", "yearSearch.do");
		
		PaymentVO pvo = new PaymentVO();
		pvo.setB_email((String) session.getAttribute("id"));
		List<PaymentVO> paysumList = paymentDao.buyerPaymentList(pvo);
		int paysum = 0;
		int upgrademoney = 0;
		for (int i = 0; i < paysumList.size(); i++) {
			PaymentVO pmvo = paysumList.get(i);
			if(pmvo.getPay_enddate() != null) {
				paysum += pmvo.getPay_price();
			}
		}
		DecimalFormat formatter = new DecimalFormat("###,###");
		String upgrademoneyform = "";
		switch (buyervo.getB_rank()) {
			case "1":
				System.out.println("1");
				upgrademoney = 1000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "2":
				System.out.println("2");
				upgrademoney = 5000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "3":
				System.out.println("3");
				upgrademoney = 10000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "4":
				System.out.println("4");
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
		}
		
		String paysumform = formatter.format(paysum);
		model.addAttribute("paysum", paysumform);
		model.addAttribute("upgrademoney",upgrademoneyform);
		
		return "buyer/buyHistory";
	}
	
	@RequestMapping("/selectdateSearch.do")
	public String selectdateSearch(Model model, HttpSession session, HttpServletResponse response,
							  HttpServletRequest request, PagingDTO pagingdto, PaymentVO paymentvo) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		model.addAttribute("buyerinfo", buyervo);
		
		if(paymentvo.getFirstDate() == null) {
			paymentvo.setFirstDate((Date) session.getAttribute("firstDate"));
		}
		
		if(paymentvo.getSecondDate() == null) {
			paymentvo.setSecondDate((Date) session.getAttribute("secondDate"));
		}
		
		paymentvo.setB_email((String) session.getAttribute("id"));
		//List<PaymentVO> paymentList = paymentDao.buyerPaymentList(paymentvo);
		paymentvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<PaymentVO> paymentList = paymentDao.selectdateSearch(paymentvo);
		List<PaymentVO> endpayList = paymentDao.endPaymentList(paymentvo);
		for(int i = 0; i < paymentList.size(); i++) {
			for(int j = 0; j < endpayList.size(); j++) {
				if(paymentList.get(i).getPay_code().equals(endpayList.get(j).getPay_code())) {
					paymentList.get(i).setEvent_end("notend");
				}
			}
		}
		pagingdto.setTotal(paymentDao.countSelectdateSearch(paymentvo));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("address", "selectdateSearch.do");
		
		session.setAttribute("firstDate", paymentvo.getFirstDate());
		session.setAttribute("secondDate", paymentvo.getSecondDate());
		
		PaymentVO pvo = new PaymentVO();
		pvo.setB_email((String) session.getAttribute("id"));
		List<PaymentVO> paysumList = paymentDao.buyerPaymentList(pvo);
		
		int paysum = 0;
		int upgrademoney = 0;
		for (int i = 0; i < paysumList.size(); i++) {
			PaymentVO pmvo = paysumList.get(i);
			if(pmvo.getPay_enddate() != null) {
				paysum += pmvo.getPay_price();
			}
		}
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		String upgrademoneyform = "";
		switch (buyervo.getB_rank()) {
			case "1":
				System.out.println("1");
				upgrademoney = 1000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "2":
				System.out.println("2");
				upgrademoney = 5000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "3":
				System.out.println("3");
				upgrademoney = 10000000;
				upgrademoney -= paysum;
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
			case "4":
				System.out.println("4");
				if(upgrademoney > 0) {
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				} else {
					upgrademoney = 0;
					upgrademoneyform = formatter.format(upgrademoney) + "???";
				}
				break;
		}
		
		String paysumform = formatter.format(paysum);
		model.addAttribute("paysum", paysumform);
		model.addAttribute("upgrademoney",upgrademoneyform);
		
		return "buyer/buyHistory";
	}

	// ?????? ?????? ???????????? ??????
	@RequestMapping("/buyerCoupons.do")
	public String buyerCoupons(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		model.addAttribute("buyerinfo", buyervo);

		CouponVO couponvo = new CouponVO();
		couponvo.setCou_id(buyervo.getBuyer_coupon());
		model.addAttribute("couponinfo", couponDao.buyerCouponSelect(couponvo));

		return "buyer/buyerCoupons";
	}

	// ?????? ????????? ???????????? ??????
	@RequestMapping("/wishlist.do")
	public String wishlist(Model model, HttpSession session, HttpServletResponse response, 
							HttpServletRequest request, PagingDTO pagingdto) {
		WishlistVO wishlistvo = new WishlistVO();
		wishlistvo.setB_id((String) session.getAttribute("id"));
		wishlistvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<WishlistVO> wishlistList = wishlistDao.selectPagingWishlist(wishlistvo);

		List<SellerVO> sellerList = sellerDao.selectSellerList();
		model.addAttribute("sellerList", sellerList);
		
		// pagination
		pagingdto.setTotal(wishlistDao.countPagingWishlist(wishlistvo));
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));
		
				
		// pagination
		
		model.addAttribute("wishlistList", wishlistList);
		
		List<ReviewVO> rateList = reviewDao.calcRateList();
		model.addAttribute("rateList",rateList);
		
		return "buyer/wishlist";
	}

	// ????????? ?????? ?????? ???????????? ??????
	@RequestMapping("/buyerUpdate.do")
	public String buyerUpdate(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request) {
		BuyerVO buyervo = new BuyerVO();
		buyervo.setB_email((String) session.getAttribute("id"));
		buyervo = buyerDao.selectBuyer(buyervo);
		model.addAttribute("buyerinfo", buyervo);

		List<CategoryVO> categoryList = categoryDao.selectCategoryList();
		System.out.println(categoryList);
		model.addAttribute("categoryList", categoryList);

		List<SubCategoryVO> subcategoryList = sub_categoryDao.sub_categoryList();
		model.addAttribute("subcategoryList", subcategoryList);

		return "buyer/buyerUpdate";
	}

	@RequestMapping(value = "/profileUpdate.do", produces = "text/plain;charset=UTF-8")
	public String profileUpdate(BuyerVO vo, MultipartFile imgupload, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, BCryptPasswordEncoder passwordEncoder) {
		if(vo.getField_code() == null) {
			BuyerVO bvo = new BuyerVO();
			bvo.setB_email((String) session.getAttribute("id"));
			bvo = buyerDao.selectBuyer(bvo);
			vo.setField_code(bvo.getField_code());
		}
		System.out.println(vo.getField_code());
		
		System.out.println("?????? ????????? ????????????" + vo.getB_password());
		String changePassword = "";
		if(vo.getB_password().equals("")) {
			System.out.println("1??? if");
			BuyerVO buyervo = new BuyerVO();
			buyervo.setB_email((String) session.getAttribute("id"));
			buyervo = buyerDao.selectBuyer(buyervo);
			changePassword = buyervo.getB_password();
		}
		
		if(!vo.getB_password().equals("")) {
			System.out.println("2??? if");
			changePassword = passwordEncoder.encode(vo.getB_password());
		}
		System.out.println(changePassword);
		vo.setB_password(changePassword);
		
		System.out.println("?????? ?????? ????????????" + vo.getB_password());
		// img upload
		BuyerVO voforimg = new BuyerVO();
		voforimg.setB_email((String) session.getAttribute("id"));
		voforimg = buyerDao.selectBuyer(voforimg);
		
		String originalFileName = imgupload.getOriginalFilename();
		String beforimg = voforimg.getB_img();
		if(originalFileName.equals("")) {
			vo.setB_img(beforimg);
		} else {
			String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
			String saveFileName = UUID.randomUUID() + extension;
			String saveurl = profileupload;
			// String saveurl = "C:\\nasa\\NASA02\\Nasa\\src\\main\\webapp\\resources\\user\\assets\\img\\profile\\";
			String savepath = saveurl + saveFileName;
			System.out.println(savepath);
			String b_img = "/upload/profile/" + saveFileName;
			//String b_img = "resources/user/assets/img/profile/" + saveFileName;
			
			vo.setB_img(b_img);
			System.out.println(vo.getB_img());
			
			try {
				imgupload.transferTo(new File(savepath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		buyerDao.updateBuyer(vo);

		return "redirect:goBuyerMypage.do";
	}

	// ????????? ????????????
	@RequestMapping("/buyerJoin.do")
	public String buyerJoin() {
		return "buyer/buyerJoin";
	}

	// ????????? ????????? ?????? ??????
	@RequestMapping("/ajaxBnickCheck.do")
	@ResponseBody
	public String ajaxBnickCheck(@Param("b_nickname") String b_nickname, BuyerVO vo) {
		int n = buyerDao.BuyerNicknameCheck(vo);
		String result;
		if (n == 0) {
			result = "T";
		} else {
			result = "F";
		}
		return result;
	}

	// ????????? ????????? ?????? ??????
	@RequestMapping("/ajaxBemailCheck.do")
	@ResponseBody
	public String ajaxBemailCheck(@Param("b_email") String b_email, BuyerVO vo) {
		vo.setB_email(b_email);

		int n = buyerDao.BuyerEmailCheck(vo);
		String result;
		if (n == 0) {
			result = "T";
		} else {
			result = "F";
		}
		return result;
	}
	
	// ????????? ????????? ??????
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/ajaxBemailSend.do")
	@ResponseBody
	public String ajaxBemailSend(@Param("b_email") String b_email) throws Exception {
		int serti = (int) ((Math.random() * (99999 - 10000 + 1)) + 10000);
		String from = "admin@nasa.com";
		String to = b_email;
		String title = "NASA ???????????? ???????????? ?????????.";
		String content = "[????????????] " + serti + " ?????????.";
		String num = "";
		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(to);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);

			mailSender.send(mail);
			num = Integer.toString(serti);
		} catch (Exception e) {
			num = "error";
		}
		return num;
	}

	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	// ????????? ?????? ??????
	@RequestMapping("/ajaxBjoin.do")
	@ResponseBody
	public String ajaxBjoin(BuyerVO vo, BCryptPasswordEncoder passwordEncoder) {
		
		String encodedPassword = passwordEncoder.encode(vo.getB_password());
		vo.setB_password(encodedPassword);
		System.out.println(vo.getB_password());

		System.out.println("????????? ??????????????????" + vo.toString());
		
		int n = buyerDao.BuyerInsert(vo);
		String result = "F";
		if (n != 0) {
			result = "T";
		}
		return result;
	}

	// ?????? ???????????? ??????
	@RequestMapping("/buyerReview.do")
	public String buyerReview(Model model, HttpSession session, HttpServletResponse response,
			HttpServletRequest request, PagingDTO pagingdto) {
		ReviewVO reviewvo = new ReviewVO();
		reviewvo.setRev_id((String) session.getAttribute("id"));
		//List<ReviewVO> reviewList = reviewDao.buyerSelectReviewList(reviewvo);
		reviewvo.calcStartEnd(pagingdto.getPageNum(), pagingdto.getAmount());
		List<ReviewVO> reviewList = reviewDao.selectPagingReviewList(reviewvo);
		model.addAttribute("reviewList", reviewList);

		List<Review_CommentVO> rclist = review_commentDao.selectReview_CommentList();
		System.out.println(rclist);
		
		pagingdto.setTotal(reviewDao.countPagingReview(reviewvo));
		model.addAttribute("rclist", rclist);
		model.addAttribute("paging", new PagingDTO(pagingdto.getTotal(), pagingdto.getPageNum()));

		return "buyer/buyerReview";
	}

	// ????????? ????????????
	@RequestMapping("/buyerCalendar.do")
	public String buyerCalendar() {
		return "buyer/buyerCalendar";
	}

}
