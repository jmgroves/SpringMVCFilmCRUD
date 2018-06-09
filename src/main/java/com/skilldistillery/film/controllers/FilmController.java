package com.skilldistillery.film.controllers;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.database.DatabaseAccessor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	DatabaseAccessor db;

	@RequestMapping(path="index.html")
	public ModelAndView home() {
		return new ModelAndView("index.html");
	}
	
	
	
	@RequestMapping(path="result.do", method=RequestMethod.GET)
	  public ModelAndView viewFilmById(int filmId) {
	    ModelAndView mv = new ModelAndView();
	    Film f;
		try {
			f = db.getFilmById(filmId);
			mv.addObject("film", f);
			mv.setViewName("/WEB-INF/result.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return mv;
	  }
}
