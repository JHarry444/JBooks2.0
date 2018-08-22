package users;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

public class Address {
	
	private String houseName;
	private PostCode postcode;
	
	public Address(String houseName, PostCode postcode) {
		this.houseName = houseName;
		this.postcode = postcode;
	}
	
	public Address() {
		
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public PostCode getPostcode() {
		return postcode;
	}

	public void setPostcode(PostCode postcode) {
		this.postcode = postcode;
	}
	
	

}
