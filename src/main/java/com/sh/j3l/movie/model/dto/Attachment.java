package com.sh.j3l.movie.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Attachment {
	private int no;
	private int movieNo;
	private String originalFilename;
	private String renamedFilename;
}
