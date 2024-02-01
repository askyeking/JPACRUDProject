package com.skilldistillery.albums.data;

import java.util.List;

import org.springframework.stereotype.Service;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

import com.skilldistillery.albums.entities.Band;

@Service
@Transactional
public class BandDAOImpl implements BandDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Band findById(int bandId) {
		return em.find(Band.class, bandId);
	}

	@Override
	public List<Band> findAll() {
		String sql = "SELECT b FROM Band b";
		return em.createQuery(sql, Band.class).getResultList();
	}

	@Override
	public Band create(Band band) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Band update(int bandId, Band band) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int bandId) {
		// TODO Auto-generated method stub
		return false;
	}

}
