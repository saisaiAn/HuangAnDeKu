package com.Integralmall.entity;

public class IntegralSystem {
	private String systemDetails;
	private Integer systemIntegral;
	public String getSystemDetails() {
		return systemDetails;
	}
	public void setSystemDetails(String systemDetails) {
		this.systemDetails = systemDetails;
	}
	public Integer getSystemIntegral() {
		return systemIntegral;
	}
	public void setSystemIntegral(Integer systemIntegral) {
		this.systemIntegral = systemIntegral;
	}
	public IntegralSystem(String systemDetails, Integer systemIntegral) {
		super();
		this.systemDetails = systemDetails;
		this.systemIntegral = systemIntegral;
	}
	
}
