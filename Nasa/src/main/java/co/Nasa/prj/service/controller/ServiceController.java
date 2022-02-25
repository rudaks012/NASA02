package co.Nasa.prj.service.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.Nasa.prj.comm.VO.ServiceVO;
import co.Nasa.prj.service.service.ServiceService;

@Controller
public class ServiceController {
	@Autowired
	private ServiceService serviceDao;
	
	
	@RequestMapping("/sellerService.do")
	public String sellerService(Model model) {
		model.addAttribute("serviceList", serviceDao.serviceList());
		return "seller/sellerService";
	}
	
	@ResponseBody
	@RequestMapping(value = "serviceInsertForm.do", method = RequestMethod.POST)
	public String fileUpload(ServiceVO vo, @RequestParam("file") MultipartFile file,@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request) {
		System.out.println(file.getOriginalFilename());
		
		for(MultipartFile file2 : multipartFile) {
			System.out.println(file2.getOriginalFilename());
		}
		
		System.out.println(vo.getSer_title());
		System.out.println(vo.getSer_sub_cate());
		
		/*
		 * String strResult = "{ \"result\":\"FAIL\" }"; String contextRoot = new
		 * HttpServletRequestWrapper(request).getRealPath("/"); String fileRoot; try {
		 * // 파일이 있을때 탄다. if(multipartFile.size() > 0 &&
		 * !multipartFile.get(0).getOriginalFilename().equals("")) {
		 * 
		 * for(MultipartFile file:multipartFile) { fileRoot =
		 * "C:\\NASA\\NASA02\\Nasa\\src\\main\\webapp\\fileupload\\";
		 * System.out.println(fileRoot);
		 * 
		 * String originalFileName = file.getOriginalFilename(); //오리지날 파일명 String
		 * extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		 * //파일 확장자 String savedFileName = UUID.randomUUID() + extension; //저장될 파일 명
		 * 
		 * File targetFile = new File(fileRoot + savedFileName); try { InputStream
		 * fileStream = file.getInputStream();
		 * FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
		 * 
		 * } catch (Exception e) { //파일삭제 FileUtils.deleteQuietly(targetFile); //저장된 현재
		 * 파일 삭제 e.printStackTrace(); break; } } strResult = "{ \"result\":\"OK\" }";
		 * System.out.println("파일이미지1"); } // 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을
		 * 등록하는경우) else strResult = "{ \"result\":\"OK\" }";
		 * System.out.println("파일이미지2"); }catch(Exception e){ e.printStackTrace(); }
		 */
		return "";
	}

}
