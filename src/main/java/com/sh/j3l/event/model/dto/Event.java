package com.sh.j3l.event.model.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@ToString(callSuper = true)
public class Event extends EventEntity {
	
	private List<EventAttachment> attachments = new ArrayList<>();
	
	public void addAttachment(EventAttachment attach) {
		this.attachments.add(attach);
	}

}
