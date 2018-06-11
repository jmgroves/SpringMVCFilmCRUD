package com.skilldistillery.film.controllers;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.sql.SQLException;
import java.util.ArrayList;
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
			if (f == null) {
				mv.addObject("noFilm", "word");
			}
			mv.addObject("film", f);
			mv.setViewName("/WEB-INF/viewFilmbyID.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return mv;
	  }
	

//We pass in filmID param and use that to get the proper film to delete
	@RequestMapping(path="deleteFilm.do", method=RequestMethod.GET)
	public ModelAndView deleteFilm(@RequestParam("filmId") String filmId) {
		ModelAndView mv = new ModelAndView();
		int filmId2 = Integer.parseInt(filmId);
		try {
			Film f = db.getFilmById(filmId2);
			String title = f.getTitle();
			db.deleteFilm(f);
			if (db.getFilmById(filmId2) == null) {
				
				mv.addObject("deletedFilm", title);
			}
			else {
				mv.addObject("failedDelete", title);
			}
			mv.setViewName("/WEB-INF/viewFilmbyID.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
//editing filmfilm -> non functional
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
		mv.addObject("addedActor", actor);
		mv.setViewName("/WEB-INF/viewActor.jsp");
	    return mv;
	  }
	@RequestMapping(path="updateFilm.do", method=RequestMethod.GET, name ="updateFilm")
	public ModelAndView updateFilm(@RequestParam("filmId") String filmId) {
	    ModelAndView mv = new ModelAndView();
	    System.out.println(filmId);
	    int filmIdString = Integer.parseInt(filmId);
		try {
			Film f = db.getFilmById(filmIdString);
			f.setId(filmIdString);
			mv.addObject("oldFilm", f);
			mv.setViewName("/WEB-INF/updateFilm.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	  }
	  @RequestMapping(path = "updateFilmDetails.do", method = RequestMethod.POST)
	    public ModelAndView updateFilmDetails(@RequestParam(name = "filmID") String filmID, Film film) throws SQLException {
	        ModelAndView mv = new ModelAndView();
	        int filmId2 = Integer.parseInt(filmID);
	        System.out.println(filmID + "***************************");
	        System.out.println(film);
	        film.setId(filmId2);
	        Film updatedFilm = film;
	        System.out.println(film.getId());
	   //     updatedFilm.setId(filmId2);
	        try {
				updatedFilm = db.updateFilm(film);
			} catch (SQLException e) {
				e.printStackTrace();
			}
	        mv.addObject("film", updatedFilm);
	        mv.setViewName("WEB-INF/viewFilmbyID.jsp");
	        return mv;
	    }
	@RequestMapping(path="updateActor.do", method=RequestMethod.GET)
	public ModelAndView editActor(@RequestParam(name = "actorID") String actorID, Actor actor) throws SQLException {
		ModelAndView mv = new ModelAndView();
		int actorID2 = Integer.parseInt(actorID);
		Actor newActor2 = db.updateActor(actorID2, actor);
		mv.addObject("actor,", newActor2);
		mv.setViewName("/WEB-INF/viewActor.jsp");
		return mv;
	}
	@RequestMapping(path="viewActor.do", method = RequestMethod.GET)
	public ModelAndView viewActor(int actorId) {
		ModelAndView mv = new ModelAndView();
		try {
			Actor actor = db.getActorById(actorId);
			if (actor.getId() == 0) {
				mv.addObject("noActor", "word");
			}
			mv.addObject("actor", actor);
			mv.setViewName("/WEB-INF/viewActor.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	@RequestMapping(path="addactorview.do", method=RequestMethod.GET, name ="addActor")
	  public ModelAndView addActor() {
	    ModelAndView mv = new ModelAndView();
		mv.addObject("actor");
		mv.setViewName("/WEB-INF/addactor.jsp");
	    return mv;
	  }
	@RequestMapping(path="updateActorView.do", method=RequestMethod.GET, name ="updateActor")
	public ModelAndView updateActorView(int actorId) throws SQLException {
		ModelAndView mv = new ModelAndView();
		Actor actor = db.getActorById(actorId);
		mv.addObject("actor", actor);
		mv.setViewName("/WEB-INF/updateActor.jsp");
		return mv;
	}
	@RequestMapping(path="addFilm.do", method=RequestMethod.GET, name ="addFilm")
	public ModelAndView addFilmView() throws SQLException {
		ModelAndView mv = new ModelAndView();
		Film f = new Film();
		mv.addObject("film", f);
		mv.setViewName("/WEB-INF/addFilmView.jsp");
		return mv;
	}
	@RequestMapping(path="addingFilm.do", method=RequestMethod.POST, name ="addingFilm")
	public ModelAndView addFilm(Film film) throws SQLException {
		ModelAndView mv = new ModelAndView();
		System.out.println(film.getDescription());
		Film newFilm = db.addFilm(film);
		mv.addObject("film", newFilm);
		mv.setViewName("/WEB-INF/viewFilmbyID.jsp");
		return mv;
	}
	@RequestMapping(path="deleteActor.do", method=RequestMethod.GET, name ="deleteActor")
	public ModelAndView deleteActor(int actorId) throws SQLException {
		ModelAndView mv = new ModelAndView();
		Actor actor = db.getActorById(actorId);
		String deletedActor = actor.getFirstName() + " " + actor.getLastName();
		mv.addObject("deletedActor", deletedActor);
		db.deleteActor(actor);
		mv.setViewName("/WEB-INF/viewActor.jsp");
		
		return mv;
	}
	

	  
//	@RequestMapping(path="edit.do", method=RequestMethod.GET, name ="updateFilm")
//	  public ModelAndView updateFilm(Film existingFilm, Film updatedFilmProperties){
//	    ModelAndView mv = new ModelAndView();	    
//		mv.setViewName("/WEB-INF/result.jsp");
//	    return mv;
//	  }

}
