package com.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.model.BoardVO;
import com.board.service.BoardService;

@Controller
@RequestMapping("/bvo")
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	// 이동 - 목록 페이지
	@GetMapping("/listPage")
	public void listGET(Model model, RedirectAttributes rttr) {
		model.addAttribute("list", bService.listBoard());
	}
	
	// 이동 - 상세목록 페이지
	@GetMapping("/detailPage")
	public void detailMoveGET(int bno, Model model) {
		model.addAttribute("list", bService.detailBoard(bno));
	}
	
	// 이동 - 수정 페이지
	@GetMapping("/modifyPage")
	public void modifyMoveGET(int bno, Model model) {
		model.addAttribute("list", bService.detailBoard(bno));
	}
	
	// 이동 - 등록 페이지
	@GetMapping("/regPage")
	public void regPageGET() {}
	
	// 기능수행 - 등록
	@PostMapping("/regPage")
	public String regPOST(BoardVO bvo, RedirectAttributes rttr) {
		
		bService.regBoard(bvo);
		
		rttr.addFlashAttribute("result", "enroll");
		
		return "redirect:/bvo/listPage";
	}
	
	// 기능수행 - 수정
	@PostMapping("/modifyPage")
	public String modifyPOST(BoardVO bvo, RedirectAttributes rttr) {
		
		bService.modifyBoard(bvo);
		
		rttr.addFlashAttribute("result", "modify");
		
		return "redirect:/bvo/listPage";
	}
	
	// 기능수행 - 삭제
	@PostMapping("/deleteBoard")
	public String deletePOST(int bno, RedirectAttributes rttr) {

		bService.deleteBoard(bno);
		
		rttr.addFlashAttribute("result", "delete");
		
		return "redirect:/bvo/listPage";
	}
	
	
	
}
