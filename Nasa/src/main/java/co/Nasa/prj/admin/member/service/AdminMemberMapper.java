package co.Nasa.prj.admin.member.service;

import java.util.List;

import co.Nasa.prj.admin.service.AdminAuthorVO;
import co.Nasa.prj.admin.service.Criteria;
import co.Nasa.prj.comm.VO.BuyerVO;
import co.Nasa.prj.comm.VO.SellerVO;

public interface AdminMemberMapper {
		//구매자
		//public List<BuyerVO> buyerList();
		public AdminAuthorVO selectBuyer(String id); //구매자 정보
<<<<<<< HEAD
		//public List<AdminAuthorVO> selectBuyerPayment(String id, Criteria cri); //구매자 정보와 결제내역
=======
		public List<AdminAuthorVO> selectBuyerPayment(String id); //구매자 정보와 결제내역
>>>>>>> 7ce0c1178169a981b57f24f918769bd56c6d3c42
		public List<BuyerVO> getListWithPaging(Criteria cri); //구매자목록 페이징
		public int getBuyerTotal();
		//판매자
		public List<SellerVO> sellerList();
}
