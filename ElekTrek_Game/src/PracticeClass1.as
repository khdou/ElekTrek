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
	public class PracticeClass1 extends AbstractPracticeProblem
	{
		private var V:Number;
		private var I:Number;
		private var R:Number;
		
		public function PracticeClass1() 
		{
			super();
			itemContainer[2][0] = new Item(Item.BATTERY_VERTICAL);
			itemContainer[1][0] = new Item(Item.WIRE_CORNER1);
			itemContainer[1][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[1][3] = new Item(Item.WIRE_CORNER2);
			itemContainer[2][3] = new Item(Item.WIRE_VERTICAL);
			itemContainer[3][3] = new Item(Item.WIRE_CORNER3);
			itemContainer[3][2] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][0] = new Item(Item.WIRE_CORNER4);
			//new Item("BatteryVertical", 0, 2, 0, false), // Type of item, row, column, value
			//new Item("WireCorner1", 0, 1, -1, false),
			//new Item("WireHorizontal", 1, 1, -1, false),
			//new Item("WireCorner2", 3, 1, -1, false),
			//new Item("WireVertical", 3, 2, -1, false),
			//new Item("WireCorner3", 3, 3, -1, false),
			//new Item("WireHorizontal", 2, 3, -1, false),
			//new Item("WireHorizontal", 1, 3, -1, false),
			//new Item("WireCorner4", 0, 3, -1, false)
			
			//create missing coordinates
			missingCoord = new Array(1);
			missingCoord[0] = new Coordinate(1, 2);
		}

		override protected function generateValues():void 
		{
			
			var length:int = Information.INVENTORY.getSize();
			var index1:int = Math.floor(Math.random() * length);
			
			I = Math.floor(Math.random() * 10) + 1;			
			
			R = Information.INVENTORY.getItem(index1).value;		
			V = I * R;		
			
			for (var i:int = 0; i < AbstractPracticeProblem.SIZE; i++) {
				for (var j:int = 0; j < AbstractPracticeProblem.SIZE; j++) {
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
		
		override public function isCorrect():Boolean {
			var missingComp1:Item = itemContainer[missingCoord[0].X][missingCoord[0].Y]
			if (missingComp1 == null) return false;
			
			return (missingComp1.value) == R ? true : false;
		}
	}

}