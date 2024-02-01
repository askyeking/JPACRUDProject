package com.skilldistillery.albums;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.albums.entities.Band;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class BandTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Band band;
	
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
		band = em.find(Band.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		band = null;
		em.close();
	}

	@Test
	void test_band_scalar_mappings() {
		assertEquals("Cap'n Jazz", band.getName());
	}

}
