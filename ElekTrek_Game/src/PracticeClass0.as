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
	public class PracticeClass0 extends AbstractPracticeProblem
	{

		public function PracticeClass0() 
		{
			super();
			itemContainer[1][0] = new Item(Item.WIRE_CORNER1);
			itemContainer[1][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[1][2] = new Item(Item.LIGHTBULB_BLOCK_OFF);
			itemContainer[1][3] = new Item(Item.WIRE_CORNER2);
			itemContainer[2][3] = new Item(Item.WIRE_VERTICAL);
			itemContainer[3][3] = new Item(Item.WIRE_CORNER3);
			itemContainer[3][2] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][1] = new Item(Item.WIRE_HORIZONTAL);
			itemContainer[3][0] = new Item(Item.WIRE_CORNER4);
			
			// Coordinate describing the original circuit problem
			config = [ 
				new Coordinate(2, 0),
				new Coordinate(1, 0),
				new Coordinate(1, 1),
				new Coordinate(1, 3),
				new Coordinate(2, 3),
				new Coordinate(3, 3),
				new Coordinate(3, 1),
				new Coordinate(3, 0),
			];
			
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
			missingCoord[0] = new Coordinate(2, 0);
		}

		override protected function generateValues():void 
		{
			
		}
		
		override public function isCorrect():Boolean {
			var m:Coordinate = missingCoord[0];
			
			var correct:Boolean = false;
			if ( itemContainer[m.X][m.Y] == null ) {
				return correct;
			}else {
				return itemContainer[m.X][m.Y].name == Item.BATTERY_VERTICAL;
			}
		}
	}

}