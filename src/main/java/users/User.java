package users;

import java.sql.Date;

public class User {

	public static class UserBuilder {

		private String username;
		private String password;
		private Address address;
		private String email;
		private long contactNumber;
		private String firstName;
		private String lastName;
		private Date birthDate;

		public User buildUser() {
			return new User(username, password, address, email, contactNumber, firstName, lastName, birthDate);
		}

		public UserBuilder setUsername(String username) {
			this.username = username;
			return this;
		}

		public UserBuilder setPassword(String password) {
			this.password = password;
			return this;
		}

		public UserBuilder setAddress(Address address) {
			this.address = address;
			return this;
		}

		public UserBuilder setEmail(String email) {
			this.email = email;
			return this;
		}

		public UserBuilder setContactNumber(long contactNumber) {
			this.contactNumber = contactNumber;
			return this;
		}

		public UserBuilder setFirstName(String firstName) {
			this.firstName = firstName;
			return this;
		}

		public UserBuilder setLastName(String lastName) {
			this.lastName = lastName;
			return this;
		}

		public UserBuilder setBirthDate(Date birthDate) {
			this.birthDate = birthDate;
			return this;
		}

	}

	private String username;
	private String password;
	private Address address;
	private String email;
	private long contactNumber;
	private String firstName;
	private String lastName;
	private Date birthDate;

	public User(String username, String password, Address address, String email, long contactNumber, String firstName,
			String lastName, Date birthDate) {
		this.username = username;
		this.password = password;
		this.address = address;
		this.email = email;
		this.contactNumber = contactNumber;
		this.firstName = firstName;
		this.lastName = lastName;
		this.birthDate = birthDate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

}
