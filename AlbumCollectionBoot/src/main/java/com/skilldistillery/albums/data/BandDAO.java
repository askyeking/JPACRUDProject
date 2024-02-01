package com.skilldistillery.albums.data;

import java.util.List;

import com.skilldistillery.albums.entities.Band;

public interface BandDAO {
	Band findById(int bandId);
	List<Band> findAll();
	Band create(Band band);
	Band update(int bandId, Band band);
	boolean deleteById(int bandId);
	
}