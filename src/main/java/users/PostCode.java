package users;

public class PostCode {
	private String postCode;
	private String street;
	private String city;
	private String country;

	public PostCode(String postCode, String street, String city, String country) {
		this.postCode = postCode;
		this.street = street;
		this.city = city;
		this.country = country;
	}

	public PostCode() {
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
