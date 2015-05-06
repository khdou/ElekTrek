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
		}

		
	}

}