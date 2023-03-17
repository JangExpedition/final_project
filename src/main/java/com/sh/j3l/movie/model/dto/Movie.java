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
@NoArgsConstructor
@ToString(callSuper = true)
public class Movie extends MovieEntity {
	
	private List<Attachment> attachments = new ArrayList<>();
	
	public void addAttachment(Attachment attach) {
		this.attachments.add(attach);
	}
}
