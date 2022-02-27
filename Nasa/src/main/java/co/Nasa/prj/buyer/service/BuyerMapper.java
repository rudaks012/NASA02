package co.Nasa.prj.buyer.service;

import java.util.List;

import co.Nasa.prj.comm.VO.BuyerVO;

public interface BuyerMapper {
	public BuyerVO selectBuyer(BuyerVO vo);
	
	// 구매자 정보 수정
	public int updateBuyer(BuyerVO vo);

}
