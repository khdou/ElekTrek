package 
{
	/**
	 * This class represent the equation/knowledge model we want student to
	 * understand as well as method for assessing their understanding
	 * 
	 * Practice Class 1 : V = IR
	 * 
	 * @author Tomit Huynh
	 */
	public class PracticeClass1 
	{
		private var V:Number;
		private var I:Number;
		private var R:Number;
		
		public var missing;

		public static var config1:Array = [
			new Item("BatteryVertical", 20, 279, 0, false), // Type of item, row, column, value
			new Item("WireCorner1", 20, 179, 0, false),
			new Item("WireHorizontal", 120, 179, 0, false),
			new Item("WireCorner2", 320, 179, 0, false),
			new Item("WireVertical", 320, 279, 0, false),
			new Item("WireVertical", 320, 279, 0, false)
		]; // there could be many map configuration to display for this knowledge model
		
		public function PracticeClass1() 
		{
			//Need to figure out how map will communicate with the equation
		}

		
		private function setupCircuitConfig(): void
		{
			
			// Assuming there would be just one battery, one resistor, and one current in this config
			// Setup values for problem
			for each (var item in config1)
			{
				var indicator = item.name.charAt(0);
				// Battery
				if (indicator == "B") {
					item.value = V;
				}else if (indicator == "R" || indicator == "L") {
					item.value = R;
				}else {
					item.value = I;
				}
			}
		}
		
		public function getCircuitConfig(): Array 
		{
			// Get all resistors from Inventory
			var resistors:Array = getResistanceFromInventory();
			
			// needs more than 2 items for good answer
			if (resistors.length < 2)
				return null;
				
			// These values should be randomized
			I = Math.floor(Math.random() * 10) + 1;
			
			var index = Math.floor(Math.random() * resistors.length);
			R = resistors[index];
			
			V = I * R
			
			setupCircuitConfig();
			
			return config1;
		}
		

		public function isCorrect(): Boolean 
		{
			var missingComp = CircuitInteractionState.getItem(2,1);
			
			return missingComp.value == R ? true : false;
		}
		
		private function getResistanceFromInventory(): Array 
		{
			var resistors:Array = [];
			for each (var item:Item in Inventory.items)
			{
				if (item.name.charAt(0) == "R")
					resistors.push(item.value);
			}
			return resistors;
		}
	}

}