package 
{
	/**
	 * Organize different circuit configurations. Basing all configuration on 5x5 grid
	 * 
	 * @author Tomit Huynh
	 */
	public class CircuitConfigs 
	{
		public static var config:Array = [
			new Item("BatteryVertical", 0, 200, 9), // Type of item, row, column, value
			new Item("WireCorner1", 0, 100, 0),
			new Item("WireHorizontal", 100, 100, 0),
			new Item("WireCorner2", 300, 100, 0),
			new Item("WireVertical", 300, 200, 0),
			new Item("WireVertical", 300, 200, 0)
		];
		
		public function CircuitConfigs() 
		{
			
		}
		
	}

}