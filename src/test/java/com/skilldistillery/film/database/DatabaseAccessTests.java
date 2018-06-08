package com.skilldistillery.film.database;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.Inventory;

class DatabaseAccessTests {
  private DatabaseAccessor db;

  @Before
  void setUp() throws Exception {
    db = new DatabaseAccessorObject();
  }

  @After
  void tearDown() throws Exception {
    db = null;
  }

  @Test
  void test_getFilmById_with_invalid_id_returns_null() throws SQLException {
    Film f = db.getFilmById(-42);
    assertNull(f);
  }
  
  @Test 
  void test_getFilmById_with_specific_id() throws SQLException {
	  Film f = db.getFilmById(38);
	  assertEquals("ARK RIDGEMONT", f.getTitle());
  }
  @Test 
  void test_getFilmById_with_specific_id2() throws SQLException {
	  Film f = db.getFilmById(1002);
	  assertEquals("Depression", f.getTitle());
  }
  
  @Test
  void get_actor_returns_right_id() throws SQLException {
	  Actor a = db.getActorById(2);
	  String actorName = a.getFirstName() + " " + a.getLastName();
	  assertEquals("Nick Wahlberg", actorName);
  }
  
  @Test
  void search_by_keyword_returns_proper_sizeList() throws SQLException {
	  List<Film> filmList = db.getFilmBySearch("Airplane");
	  assertEquals(2, filmList.size());
  }
  @Test
  void correct_number_of_actors_in_list() throws SQLException {
	  List<Actor> filmList =db.getActorsByFilmId(55);
	  assertEquals(5, filmList.size());
  }
  
  @Test
  void returning_correct_number_of_copies() throws SQLException {
	  List<Inventory> list = db.getInventoryAndCondition(1);
	  assertEquals(28, list.size());
  }

}
