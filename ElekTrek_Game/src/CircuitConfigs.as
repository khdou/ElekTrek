package 
{
	/**
	 * Organize different circuit configurations. Basing all configuration on 5x5 grid
	 * 
	 * @author Tomit Huynh
	 */
	import org.flixel.*;
	public class CircuitConfigs 
	{
		
		public static var config:Array = [
			new Item("BatteryVertical", 18, 279, 9, false), // Type of item, row, column, value
			new Item("WireCorner1", 18, 179, 0, false),
			new Item("WireHorizontal", 118, 179, 0, false),
			new Item("WireCorner2", 318, 179, 0, false),
			new Item("WireVertical", 318, 279, 0, false),
			new Item("WireVertical", 318, 279, 0, false)
		];
		
		public function CircuitConfigs() 
		{
			
		}
		
	}

}