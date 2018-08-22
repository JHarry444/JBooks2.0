package orders;

public enum OrderStatus {
	
	IN_PROGRESS ("In-progress") {
		@Override
		public String getName() {
			// TODO Auto-generated method stub
			return super.getName();
		}
	}, COMPLETE("Complete");
	
	private String name = "";
	
	OrderStatus (String name) {
		this.name = name;
	}
	
	public String getName() {
		return this.name;
	}
}
