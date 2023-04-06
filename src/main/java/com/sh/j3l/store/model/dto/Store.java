package com.sh.j3l.store.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Store {

	private String name;
	private String cinemaName;
	private String originalFilename;
	private String renamedFilename;
	private int price;
	private SnackCategory snackCategory;
}
