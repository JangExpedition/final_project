package com.sh.j3l.movie.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.sh.j3l.member.model.dto.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)
public class Movie extends MovieEntity {
	
	private int attachCount;
	private List<Attachment> attachments = new ArrayList<>();
	private Member member;
	
	
	public Movie(int no, String title, com.sh.j3l.movie.model.dto.Genre Genre, String director, String actors,
			String synopsis, int limit_age) {
		super(no, title, Genre, director, actors, synopsis, limit_age);
		this.attachCount = attachCount;
	}
	
	public void addAttachment(Attachment attach) {
		this.attachments.add(attach);
	}
	
	
	
	


}
