package com.skilldistillery.albums;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.albums.entities.Album;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class AlbumTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Album album;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("AlbumCollectionJPA");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
		emf = null;
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		album = em.find(Album.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		album = null;
		em.close();
	}

	@Test
	void test_band_scalar_mappings() {
		assertEquals("Burritos, Inspiration Point, "
				+ "Fork Balloon Sports, Cards in the Spokes, Automatic Biographies,"
				+ " Kites, Kung Fu, Trophies, Banana Peels We've Slipped On and Egg "
				+ "Shells We've Tippy Toed Over", album.getTitle());
	}
	
	void test_Album_has_songs() {
		assertEquals(12, album.getSongs());
	}

}
