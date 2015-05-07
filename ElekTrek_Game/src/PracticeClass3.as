package
{
	//puzzle for 3 resistors in series 
	public class PracticeClass3 extends AbstractPracticeProblem
	{
		
		public function PracticeClass3() 
		{
			super();
			itemContainer[2][0] = new Item(Item.BATTERY_VERTICAL);
			itemContainer[1][0] = new Item(Item.WIRE_CORNER1);
			itemContainer[1][2] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[1][4] = new Item(Item.WIRE_CORNER2);
			itemContainer[2][4] = new Item(Item.WIRE_VERTICAL);
			itemContainer[3][4] = new Item(Item.WIRE_CORNER3);
			itemContainer[3][3] = new Item(Item.WIRE_CORNER3);
			itemContainer[3][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][0] = new Item(Item.WIRE_CORNER4);
			
			// Coordinate describing the original circuit problem
			config = [ 
				new Coordinate(2, 0),
				new Coordinate(1, 0),
				new Coordinate(1, 2),
				new Coordinate(1, 4),
				new Coordinate(2, 4),
				new Coordinate(3, 4),
				new Coordinate(3, 3),
				new Coordinate(3, 1),
				new Coordinate(3, 0),
			];
			
			//create missing coordinates
			missingCoord = new Array(3);
			missingCoord[0] = new Coordinate(1, 1);
			missingCoord[1] = new Coordinate(1, 3);
			missingCoord[2] = new Coordinate(3, 2);
			//generateValues();
			
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
			
			R = resistors[index1] + resistors[index2] + resistors[index3];
			
			V = I * R			
			
			return config1;
		}
		
		
		override public function isCorrect(): Boolean 
		{
			var missingComp1:Item = itemContainer[missingCoord[0].X][missingCoord[0].Y]
			var missingComp2:Item = itemContainer[missingCoord[1].X][missingCoord[1].Y]
			var missingComp3:Item = itemContainer[missingCoord[2].X][missingCoord[2].Y]
			if (missingComp1 == null || missingComp2 == null || missingComp3 == null) return false;
			
			return (missingComp1.value + missingComp2.value + missingComp3.value) == R ? true : false;
		}
		
	}
}