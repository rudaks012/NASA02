package co.Nasa.prj.comm.VO;

import lombok.Data;

@Data
public class SellerVO {
	String s_email; // 판매자 id
	String s_rank;
	String s_password;
	String s_nickname;
	String s_tel;
	String s_address;
	String s_zipcode;
	String s_detailaddress;
	String s_author;
	String s_img; // 프로필 사진
	String s_business;
	String s_status;
	String s_date;
	int s_report;
	String s_school;
	String s_major;
	String s_grad; // 졸업상태
	String s_carrer;
	String s_me; // 자기소개
	String s_name;
	String s_dates; // 날짜 to_char

	
	String b_email; // 채팅용 vo
	String b_nickname; // 채팅용 vo
}
