package
{
	
	//simple parallel
	public class PracticeClass6
	{
		private var V:Number;
		private var I:Number;
		private var R:Number;
		
		public var missing;
		
		public var config1:Array; // there could be many map configuration to display for this knowledge model
		
		public function PracticeClass6() 
		{
			config1 = [
				new Item("BatteryVertical", 0, 2, 0, false), // Type of item, row, column, value
				new Item("WireCorner1", 0, 1, -1, false),
				new Item("WireCorner1", 0, 0, -1, false),
				new Item("WireHorizontal", 1, 1, -1, false),
				new Item("WireHorizontal", 1, 0, -1, false),
				new Item("WireCorner2", 3, 1, -1, false),
				new Item("WireCorner2", 3, 0, -1, false),
				new Item("WireVertical", 3, 2, -1, false),
				new Item("WireCorner3", 3, 3, -1, false),
				new Item("WireHorizontal", 1, 3, -1, false),
				new Item("WireHorizontal", 2, 3, -1, false),
				new Item("WireCorner4", 0, 3, -1, false)
			];
		}
		
		private function setupCircuitConfig(): void
		{
			
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
			
			if (resistors.length < 3)
				return null;
			
			// These values should be randomized
			I = Math.floor(Math.random() * 10) + 1;
			
			var index1 = Math.floor(Math.random() * resistors.length);
			
			var index2 = Math.floor(Math.random() * resistors.length);
			while (index2 == index1)
				index2 = Math.floor(Math.random() * resistors.length);
			
			R = Math.round(1/(1/resistors[index1] + 1/resistors[index2]));
			
			V = I * R
			
			setupCircuitConfig();
			
			return config1;
		}
		
		
		public function isCorrect(): Boolean 
		{
			var missingComp1 = CircuitInteractionState.getItem(2,1);
			var missingComp2 = CircuitInteractionState.getItem(2,0);
			if (missingComp1 == null || missingComp2 == null) return false;
			
			return (Math.round(1/(1/missingComp1.value + 1/missingComp2.value))) == R ? true : false;
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