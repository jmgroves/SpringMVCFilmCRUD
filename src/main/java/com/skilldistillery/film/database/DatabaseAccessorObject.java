package com.skilldistillery.film.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.Inventory;

@Component
public class DatabaseAccessorObject implements DatabaseAccessor {
	private static String url = "jdbc:mysql://localhost:3306/sdvid";
    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("Error loading mySql driver");
            e.printStackTrace();
        }
    }

	@Override
	public Film getFilmById(int filmId) throws SQLException {
		if (filmId <= 0) {
			return null;
		}
		String user = "student";
		String pass = "student";
		Connection conn = DriverManager.getConnection(url, user, pass);
		String sqltext;
		// sqltext = "SELECT film.id, title, description, release_year, language.name,
		// rental_duration, rental_rate, length, replacement_cost, rating,
		// special_features, category.name FROM film JOIN language ON language.id =
		// language_id JOIN film_category ON film.id = film_id JOIN category ON
		// category.id = category_id WHERE film.id = ?";
		sqltext = "SELECT film.id, title, description, release_year, language.name, rental_duration, rental_rate, length, replacement_cost, rating, special_features FROM film JOIN language ON language.id = language_id WHERE film.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sqltext);
		stmt.setInt(1, filmId);
		List<String> categories = new ArrayList<>();

		ResultSet rs = stmt.executeQuery();
		Film film = new Film();
		if (rs.next()) {
			int filmId2 = rs.getInt(1);
			String title = rs.getString(2);
			String desc = rs.getString(3);
			short releaseYear = rs.getShort(4);
			String lang = rs.getString(5);
			int rentDur = rs.getInt(6);
			double rate = rs.getDouble(7);
			int length = rs.getInt(8);
			double repCost = rs.getDouble(9);
			String rating = rs.getString(10);
			String features = rs.getString(11);
			film = new Film(filmId2, title, desc, releaseYear, lang, rentDur, rate, length, repCost, rating, features,
					getActorsByFilmId(filmId));

		}
		sqltext = "SELECT category.name from film\n" + "    join film_category on film_id = film.id\n"
				+ "      join category on category.id = category_id\n" + "        where film.id = ?";
		stmt = conn.prepareStatement(sqltext);
		stmt.setInt(1, filmId);
		rs = stmt.executeQuery();
		if (rs.next()) {
			categories.add(rs.getString(1));
			film.setCategories(categories);
		}
		return film;
	}

	@Override
	public Actor getActorById(int actorId) throws SQLException {

		String user = "student";
		String pass = "student";
		Connection conn = DriverManager.getConnection(url, user, pass);
		String sqltext;
		sqltext = "SELECT id, first_name, last_name FROM actor WHERE id = ?";
		PreparedStatement stmt = conn.prepareStatement(sqltext);
		stmt.setInt(1, actorId);

		ResultSet rs = stmt.executeQuery();
		Actor actor = new Actor();
		if (rs.next()) {
			int id = rs.getInt(1);
			String firstName = rs.getString(2);
			String lastName = rs.getString(3);

			actor = new Actor(id, firstName, lastName);
		}
		rs.close();
		stmt.close();
		conn.close();
		return actor;
	}

	@Override
	public List<Actor> getActorsByFilmId(int filmId) throws SQLException {
		String user = "student";
		String pass = "student";
		Connection conn = DriverManager.getConnection(url, user, pass);
		String sqltext;
		sqltext = "SELECT actor_id FROM film JOIN film_actor ON film.id = film_actor.film_id " + " WHERE film_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sqltext);
		stmt.setInt(1, filmId);
		ResultSet rs = stmt.executeQuery();
		List<Actor> list = new ArrayList<Actor>();
		while (rs.next()) {
			list.add(getActorById(rs.getInt(1)));
		}
		rs.close();
		stmt.close();
		conn.close();
		return list;
	}

	@Override
	public List<Film> getFilmBySearch(String word) throws SQLException {
		if (word == null || word.equals("")) {
			return null;
		}

		String user = "student";
		String pass = "student";
		Connection conn = DriverManager.getConnection(url, user, pass);
		String sqltext;
		sqltext = "SELECT film.id, title, description, release_year, name, rental_duration, rental_rate, length, replacement_cost, rating, special_features FROM film JOIN language ON language.id = language_id WHERE description LIKE ? OR title LIKE ? ORDER BY film.id ASC";
		PreparedStatement stmt = conn.prepareStatement(sqltext);
		stmt.setString(1, "%" + word + "%");
		stmt.setString(2, "%" + word + "%");

		ResultSet rs = stmt.executeQuery();
		Film film = new Film();
		List<Film> filmList = new ArrayList<>();
		while (rs.next()) {
			int filmId2 = rs.getInt(1);
			String title = rs.getString(2);
			String desc = rs.getString(3);
			short releaseYear = rs.getShort(4);
			String lang = rs.getString(5);
			int rentDur = rs.getInt(6);
			double rate = rs.getDouble(7);
			int length = rs.getInt(8);
			double repCost = rs.getDouble(9);
			String rating = rs.getString(10);
			String features = rs.getString(11);

			film = new Film(filmId2, title, desc, releaseYear, lang, rentDur, rate, length, repCost, rating, features,
					getActorsByFilmId(filmId2));
			filmList.add(film);
		}
		rs.close();
		stmt.close();
		conn.close();
		return filmList;
	}

	public List<Inventory> getInventoryAndCondition(int filmId) throws SQLException {
		String user = "student";
		String pass = "student";
		Connection conn = DriverManager.getConnection(url, user, pass);
		String sqltext;
		sqltext = "SELECT film.title, media_condition, store_id FROM film JOIN inventory_item on film.id = film_id WHERE film.id = ? order by store_id asc";
		PreparedStatement stmt = conn.prepareStatement(sqltext);
		stmt.setInt(1, filmId);
		ResultSet rs = stmt.executeQuery();
		List<Inventory> list = new ArrayList<Inventory>();
		while (rs.next()) {
			String title = rs.getString(1);
			String condition = rs.getString(2);
			int storeId = rs.getInt(3);
			Inventory movie = new Inventory(condition, storeId, title);
			list.add(movie);

		}
		rs.close();
		stmt.close();
		conn.close();
		return list;
	}

	@Override
	public Film addFilm(Film film) throws SQLException {
		Connection conn = null;
		String user = "student";
		String pass = "student";
		try {
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false); // START TRANSACTION
			String sql = "INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setInt(3, film.getReleaseYear());
			stmt.setInt(4, 1);
			stmt.setInt(5, film.getRentalDuration());
			stmt.setDouble(6, film.getRentalRates());
			stmt.setInt(7, film.getLength());
			stmt.setDouble(8, film.getReplacementCost());
			stmt.setString(9, film.getRating());
			stmt.setString(10, film.getSpecialFeatures());
			int updateCount = stmt.executeUpdate();
			if (updateCount == 1) {
				ResultSet keys = stmt.getGeneratedKeys();
				if (keys.next()) {
					int newFilmId = keys.getInt(1);
					film.setId(newFilmId);

					System.out.println(film.getId());
					// if (film.getTitle() != null && film.getTitle().length() > 0) {
					// sql = "INSERT INTO film_actor (film_id, actor_id) VALUES (?, null)";
					// stmt = conn.prepareStatement(sql);
					// //for (Film film : film.getFilms()) {
					// stmt.setInt(1, film.getId());
					// updateCount = stmt.executeUpdate();
					// }
					// //}
				}
			} else {
				film = null;
			}
			conn.commit();
			System.out.println("commited");// COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			throw new RuntimeException("Error inserting film " + film);
		}
		return film;
	}

	public boolean deleteFilm(Film film) {
		String user = "student";
		String pass = "student";
		Connection conn = null;
		try {
			// delete child from film actor
			conn = DriverManager.getConnection(url, user, pass);
			conn.setAutoCommit(false); // START TRANSACTION
			// String sql = "DELETE FROM film_actor WHERE film_id = ?";
			// PreparedStatement stmt = conn.prepareStatement(sql);
			// stmt.setInt(1, film.getId());
			// int updateCount = stmt.executeUpdate();
			// delete child from film category
			// sql = "delete from film_category where film_id = ?";
			// stmt = conn.prepareStatement(sql);
			// stmt.setInt(1, film.getId());
			// updateCount = stmt.executeUpdate();

			// delete child from rental through inventory item
			// sql = "DELETE r FROM rental r JOIN inventory_item i ON i.id = r.inventory_id
			// where i.film_id = ?";
			// stmt = conn.prepareStatement(sql);
			// stmt.setInt(1, film.getId());
			// updateCount = stmt.executeUpdate();
			//
			// sql = "DELETE FROM inventory_item WHERE film_id = ?";
			// stmt = conn.prepareStatement(sql);
			// stmt.setInt(1, film.getId());
			// updateCount = stmt.executeUpdate();

			String sql = "DELETE FROM film WHERE id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());
			int updateCount = stmt.executeUpdate();
			conn.commit(); // COMMIT TRANSACTION
		} catch (SQLException sqle) {
			sqle.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Error trying to rollback");
				}
			}
			return false;
		}
		return true;
	}

}
