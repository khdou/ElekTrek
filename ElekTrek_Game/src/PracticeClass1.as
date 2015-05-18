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
		
		public function PracticeClass1() 
		{
			super();
			
			id = 1;
			itemContainer[2][0] = new Item(Item.BATTERY_VERTICAL);
			itemContainer[1][0] = new Item(Item.WIRE_CORNER1);
			itemContainer[1][1] = new Item(Item.WIRE_HORIZONTAL);
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
				new Coordinate(3, 2),
				new Coordinate(3, 1),
				new Coordinate(3, 0),
			];
			
			//create missing coordinates
			missingCoord = new Array(1);
			missingCoord[0] = new Coordinate(1, 2);
			generateValues();
			
			problemText = "The battery is " + V + " volts. Place the correct resistor so the resulting current is " + I + " amps.";
			dialogue = "It looks like this door is missing a resistor and needs a certain magnitude of current flow for the door to open. The relationship between Voltage(V) measured in Volts, Current(I) measured in Amps, and Resistance(R) measured in Ohms is V = I * R."
		}

		override protected function generateValues():void 
		{
			
			var length:int = Inventory.getSize();
			var index1:int = Math.floor(Math.random() * length);
			
			
			I = Math.floor(Math.random() * 10) + 1;			
			
			R = Inventory.getItem(index1).value;		
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
		
		override public function isCorrect():Boolean {
			var missingComp1:Item = itemContainer[missingCoord[0].X][missingCoord[0].Y]
			if (missingComp1 == null) return false;
			
			if ((missingComp1.value) == R) {
				return true;
			}
			else if ((missingComp1.value) > R) {
				feedback = "Uh oh, it looks like the current generated is too low, try again!";
				return false;
			}
			else {
				feedback = "Uh oh, it looks like the current generated is too high, try again!";
				return false;
			}
		}
	}

}