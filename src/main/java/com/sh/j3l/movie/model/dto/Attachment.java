package com.sh.j3l.movie.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment {
	private int no;
	private int movieNo;
	private String originalFilename;
	private String renamedFilename;
}
