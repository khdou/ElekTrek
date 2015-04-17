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

		public static var config1:Array = [
			new Item("BatteryVertical", 18, 278, 0, false), // Type of item, row, column, value
			new Item("WireCorner1", 18, 178, 0, false),
			new Item("WireHorizontal", 118, 178, 0, false),
			new Item("WireCorner2", 318, 178, 0, false),
			new Item("WireVertical", 318, 278, 0, false),
			new Item("WireVertical", 318, 278, 0, false)
		]; // there could be many map configuration to display for this knowledge model
		
		public function PracticeClass1() 
		{
			//Need to figure out how map will communicate with the equation
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
			// These values should be randomized
			V = 9;
			R = 100;
			I = 2;
			
			setupCircuitConfig();
			
			return config1;
		}
		
		public function isCorrect(): String {
			var missingComp = CircuitInteractionState.getItem(2,1);
			var answer = V / I;
			return answer.toString() + missingComp.value.toString();
		}
	}

}