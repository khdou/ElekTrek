package
{
	//parallel and series 
	public class PracticeClass4 extends AbstractPracticeProblem
	{
		private var V:Number;
		private var I:Number;
		private var R:Number;
		
		public var missing;
		
		public var config1:Array; // there could be many map configuration to display for this knowledge model
		
		public function PracticeClass4() 
		{
			super();
			itemContainer[2][0] = new Item(Item.BATTERY_VERTICAL);
			itemContainer[1][0] = new Item(Item.WIRE_CORNER1);
			itemContainer[0][0] = new Item(Item.WIRE_CORNER1);
			itemContainer[1][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[0][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[0][3] = new Item(Item.WIRE_CORNER2);
			itemContainer[1][3] = new Item(Item.WIRE_CORNER2);
			itemContainer[2][3] = new Item(Item.WIRE_VERTICAL);
			itemContainer[3][3] = new Item(Item.WIRE_CORNER3);
			itemContainer[3][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][0] = new Item(Item.WIRE_CORNER4);
			
			// Coordinate describing the original circuit problem
			config = [ 
				new Coordinate(2, 0),
				new Coordinate(1, 0),
				new Coordinate(0, 0),
				new Coordinate(1, 1),
				new Coordinate(0, 1),
				new Coordinate(0, 3),
				new Coordinate(1, 3),
				new Coordinate(2, 3),
				new Coordinate(3, 3),
				new Coordinate(3, 1),
				new Coordinate(3, 0),
			];
			
			//create missing coordinates
			missingCoord = new Array(2);
			missingCoord[0] = new Coordinate(1, 2);
			missingCoord[0] = new Coordinate(0, 2);
			missingCoord[1] = new Coordinate(3, 2);
			//generateValues();

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
			var index3 = Math.floor(Math.random() * resistors.length);
			while (index3 == index1 || index3 == index2)
				var index3 = Math.floor(Math.random() * resistors.length);
			
			R = Math.round(1/(1/resistors[index1] + 1/resistors[index2])) + resistors[index3];
			
			V = I * R
			
			setupCircuitConfig();
			
			return config1;
		}
		
		
		public function isCorrect(): Boolean 
		{
			var missingComp1:Item = itemContainer[missingCoord[0].X][missingCoord[0].Y]
			var missingComp2:Item = itemContainer[missingCoord[1].X][missingCoord[1].Y]
			var missingComp3:Item = itemContainer[missingCoord[2].X][missingCoord[2].Y]
			if (missingComp1 == null || missingComp2 == null || missingComp3 == null) return false;
			
			return (Math.round(1/(1/missingComp1.value + 1/missingComp2.value)) + missingComp3.value) == R ? true : false;
		}
		
	}
}