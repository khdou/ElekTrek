package
{
	
	//simple parallel
	public class PracticeClass6 extends AbstractPracticeProblem
	{
		
		public function PracticeClass6() 
		{
			
			super();
			itemContainer[2][0] = new Item(Item.BATTERY_VERTICAL);
			itemContainer[1][0] = new Item(Item.WIRE_T4);
			itemContainer[0][0] = new Item(Item.WIRE_CORNER1);
			itemContainer[1][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[0][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[0][3] = new Item(Item.WIRE_CORNER2);
			itemContainer[1][3] = new Item(Item.WIRE_T3);
			itemContainer[2][3] = new Item(Item.WIRE_VERTICAL);
			itemContainer[3][3] = new Item(Item.WIRE_CORNER3);
			itemContainer[3][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][2] = new Item(Item.WIRE_HORIZONTAL);
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
				new Coordinate(3, 2),
				new Coordinate(3, 0),
			];
			
			//create missing coordinates
			missingCoord = new Array(2);
			missingCoord[0] = new Coordinate(0, 2);
			missingCoord[1] = new Coordinate(1, 2);
			generateValues();
			
			problemText = "The battery is " + V + " volts. Place the correct resistor so the resulting current is " + I + " amps."; 
			dialogue = "There are two missing resistors on two separate branches(in parallel)! If resistors R1 and R2 are placed the parallel, then the resulting resistance of the main loop is equal to 1/(1/R1 + 1/R2). "
		}
		
		override protected function generateValues():void 
		{		
			var length:int = Inventory.getSize();
			var index1:int = Math.floor(Math.random() * length);
			var index2:int = Math.floor(Math.random() * length);
			while (index2 == index1)
				index2 = Math.floor(Math.random() * length);
			
			
			I = Math.floor(Math.random() * 10) + 1;						
			R = Math.round(1/(1/Inventory.getItem(index1).value + 1/Inventory.getItem(index2).value));
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
		
		override public function isCorrect(): Boolean 
		{
			var missingComp1:Item = itemContainer[missingCoord[0].X][missingCoord[0].Y]
			var missingComp2:Item = itemContainer[missingCoord[1].X][missingCoord[1].Y]
			if (missingComp1 == null || missingComp2 == null) return false;
			
			return (Math.round(1/(1/missingComp1.value + 1/missingComp2.value))) == R ? true : false;
		}
	}
}