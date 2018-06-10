package com.skilldistillery.film.controllers;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.database.DatabaseAccessor;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	DatabaseAccessor db;

	@RequestMapping(path="index.html")
	public ModelAndView home() {
		return new ModelAndView("index.html");
	}
	
	
//views film by id parameter passed in.
	@RequestMapping(path="result.do", method=RequestMethod.GET, name = "filmId")
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
	

//We pass in filmID param and use that to get the proper film to delete
	@RequestMapping(path="delete.do", method=RequestMethod.GET)
	public ModelAndView deleteFilm(@RequestParam("filmId") String filmId) {
		ModelAndView mv = new ModelAndView();
		int filmId2 = Integer.parseInt(filmId);
		try {
			Film f = db.getFilmById(filmId2);
			mv.addObject("deletedFilm", f.getTitle());
			db.deleteFilm(f);
			mv.setViewName("/WEB-INF/result.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
//editing filmfilm -> non functional
	@RequestMapping(path="edit.do", method=RequestMethod.GET)
	public ModelAndView editFilm(Film oldFilm, Film updatedFilm) {
		ModelAndView mv = new ModelAndView();
		Film f = oldFilm;
		Film f2 = updatedFilm;
		try {
			db.updateFilm(oldFilm, updatedFilm);
			mv.addObject("film", f);
			mv.addObject("newFilm", f);
			mv.setViewName("/WEB-INF/result.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
//We pass in a string that is queried using % around the string to detect the word in desc or title 
	@RequestMapping(path="searchresult.do", method=RequestMethod.GET, name ="filmKeyword")
	  public ModelAndView viewFilmBySearch(String filmKeyword) {
	    ModelAndView mv = new ModelAndView();
	    List<Film> f;
		try {
			f = db.getFilmBySearch(filmKeyword);
			mv.addObject("filmList", f);
			mv.setViewName("/WEB-INF/searchresult.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return mv;
	  }
	@RequestMapping(path="addactor.do", method=RequestMethod.GET, name ="addActor")
	  public ModelAndView addActor(String firstName, String lastName) {
	    ModelAndView mv = new ModelAndView();
	    Actor actor = new Actor();
	    actor.setFirstName(firstName);
	    actor.setLastName(lastName);
		db.addActor(actor);
		mv.addObject("actor", actor);
		mv.setViewName("/WEB-INF/addactor.jsp");
	    return mv;
	  }
	@RequestMapping(path="updateFilm.do", method=RequestMethod.GET, name ="updateFilm")
	  public ModelAndView displayEditPage(){
	    ModelAndView mv = new ModelAndView();	    
		mv.setViewName("/WEB-INF/updateFilm.jsp");
	    return mv;
	  }
//	@RequestMapping(path="edit.do", method=RequestMethod.POST, name ="updateFilm")
//	  public ModelAndView updateFilm(Film existingFilm, Film updatedFilmProperties){
//	    ModelAndView mv = new ModelAndView();	    
//		mv.setViewName("/WEB-INF/result.jsp");
//	    return mv;
//	  }

}
