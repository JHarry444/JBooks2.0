package orders;

public enum TrafficLight {
	RED,
	AMBER,
	GREEN {
		@Override
		public boolean canIGo() {
			return true;
		}
	};

	public boolean canIGo() {
		return false;
	}
}
