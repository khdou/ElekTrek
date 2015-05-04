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

		public var config1:Array; // there could be many map configuration to display for this knowledge model

		public function PracticeClass1() 
		{
			config1 = [
			new Item("BatteryVertical", 0, 2, 0, false), // Type of item, row, column, value
			new Item("WireCorner1", 0, 1, -1, false),
			new Item("WireHorizontal", 1, 1, -1, false),
			new Item("WireCorner2", 3, 1, -1, false),
			new Item("WireVertical", 3, 2, -1, false),
			new Item("WireCorner3", 3, 3, -1, false),
			new Item("WireHorizontal", 2, 3, -1, false),
			new Item("WireHorizontal", 1, 3, -1, false),
			new Item("WireCorner4", 0, 3, -1, false)
			];
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
			
			if (missingComp == null) return false;
			
			return missingComp.value == R ? true : false;
		}
		
		private function getResistanceFromInventory(): Array 
		{
			//var resistors:Array = [];
			//for each (var item:Item in Inventory.items)
			//{
				//if (item.name.charAt(0) == "R")
					//resistors.push(item.value);
			//}
			//return resistors;
			
			return Inventory.items;
		}
	}

}