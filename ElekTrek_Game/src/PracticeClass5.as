package
{
	//2 parallel in series
	public class PracticeClass5 extends AbstractPracticeProblem
	{
		private var V:Number;
		private var I:Number;
		private var R:Number;
		
		public var missing;
		
		public var config1:Array; // there could be many map configuration to display for this knowledge model
		
		public function PracticeClass5() 
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
			itemContainer[4][3] = new Item(Item.WIRE_CORNER3);
			itemContainer[3][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[4][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][0] = new Item(Item.WIRE_CORNER4);
			itemContainer[4][0] = new Item(Item.WIRE_CORNER4);
			
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
				new Coordinate(4, 3),
				new Coordinate(4, 1),
				new Coordinate(4, 0),
			];
			
			//create missing coordinates
			missingCoord = new Array(4);
			missingCoord[0] = new Coordinate(1, 2);
			missingCoord[1] = new Coordinate(0, 2);
			missingCoord[2] = new Coordinate(3, 2);
			missingCoord[2] = new Coordinate(4, 2);
			generateValues();

		}
		
		override protected function generateValues():void 
		{		
			var length:int = Inventory.getSize();
			var index1:int = Math.floor(Math.random() * length);
			var index2:int = Math.floor(Math.random() * length);
			while (index2 == index1)
				index2 = Math.floor(Math.random() * length);
			var index3 = Math.floor(Math.random() * length);
			while (index3 == index1 || index3 == index2)
				var index3 = Math.floor(Math.random() * length);
			var index4 = Math.floor(Math.random() * length);
			while (index4 == index1 || index4 == index2 || index4 == index3)
				var index3 = Math.floor(Math.random() * length);
			
			I = Math.floor(Math.random() * 10) + 1;		
			R = Math.round(1/(1/Inventory.getItem(index1).value + 1/Inventory.getItem(index2).value) + 1/(1/Inventory.getItem(index3).value + 1/Inventory.getItem(index4).value) ) ;		
			V = I * R;		
			
			for (var i:int = 0; i < AbstractPracticeProblem.SIZE; i++) {
				for (var j:int = 0; j < AbstractPracticeProblem.SIZE; j++) {
					
					var component:Item = itemContainer[i][j];
					if (component != null) {
						var indicator:String = itemContainer[i][j].name.charAt(0);
						// Battery
						if (indicator == "B") {
							itemContainer[i][j].value = V;
						}else if (indicator == "R" || indicator == "L") {
							itemContainer[i][j].value = R;
						}else {
							itemContainer[i][j].value = I;
						}
					}
				}
			}
			
		}
			
		public function isCorrect():Boolean 
		{
			var missingComp1:Item = itemContainer[missingCoord[0].X][missingCoord[0].Y]
			var missingComp2:Item = itemContainer[missingCoord[1].X][missingCoord[1].Y]
			var missingComp3:Item = itemContainer[missingCoord[2].X][missingCoord[2].Y]
			var missingComp4:Item = itemContainer[missingCoord[3].X][missingCoord[3].Y]
			if (missingComp1 == null || missingComp2 == null || missingComp3 == null || missingComp4 == null) return false;
			
			return (Math.round(1/(1/missingComp1.value + 1/missingComp2.value) + 1/(1/missingComp3.value + 1/missingComp4.value) )) == R ? true : false;
		}
	}
}// ActionScript file