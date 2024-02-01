package com.skilldistillery.albums.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.albums.data.BandDAO;

@Controller
public class BandController {
	
	@Autowired
	private BandDAO bandDao;
	
	@RequestMapping(path = { "/", "home.do" } )
	public String index(Model model) {
		model.addAttribute("bandList", bandDao.findAll());
		return "home";
	}

	@RequestMapping(path = { "showBand.do" } )
	public String showFrog(Model model, @RequestParam("bandId") Integer bandId) {
		model.addAttribute("band", bandDao.findById(bandId));
		return "bandDetails";
	}
	
}