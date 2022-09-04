package com.ispan.team6.dto;

import com.ispan.team6.entity.Restaurant;

public class RestDistance {

	private Restaurant res;
	
	public Integer distance;
	
	public RestDistance() {
	}

	public Restaurant getRes() {
		return res;
	}

	public void setRes(Restaurant res) {
		this.res = res;
	}

	public Integer getDistance() {
		return distance;
	}

	public void setDistance(Integer distance) {
		this.distance = distance;
	}

	
}
