package com.skilldistillery.film.database;

import java.sql.SQLException;
import java.util.List;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.Inventory;

public interface DatabaseAccessor {
  public Film getFilmById(int filmId) throws SQLException;
  public Actor getActorById(int actorId) throws SQLException;
  public List<Actor> getActorsByFilmId(int filmId) throws SQLException;
  public List<Film> getFilmBySearch(String word) throws SQLException;
  public List<Inventory> getInventoryAndCondition(int filmId) throws SQLException;
  public Film addFilm(Film film) throws SQLException;
  public boolean deleteFilm(Film film) throws SQLException;
  public Actor addActor(Actor actor);
  public Film updateFilm(Film existingFilm, Film updatedFilmProperties) throws SQLException;
}
