package com.skilldistillery.albums;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.albums.entities.Genre;
import com.skilldistillery.albums.entities.Status;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class StatusTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Status status;
	
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
		status = em.find(Status.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		status = null;
		em.close();
	}

	@Test
	void test_band_scalar_mappings() {
		assertEquals("Own", status.getName());
	}

}
