package
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	/**
	 * CircuitInteractionState render the circuitscreen and handle 
	 * the user interaction for the circuit puzzle. GUI is coded 
	 * based on screensize 800x600. 
	 * 
	 * Information about the Practice Problems should be loaded in. 
	 * Such as what circuit puzzle problem it is
	 * 
	 * @author Tomit Huynh
	 */
	public class CircuitInteractionState extends FlxState
	{
		private var itemsTracker:Array; // Tracking the item in the grid using 2D array. [row][col]
		private var practiceProblem:AbstractPracticeProblem;
		/**
		 * Similar to the constructor, FlxG call this after FlxG.switchState() is done
		 */
		override public function create(): void{
			
			FlxG.bgColor = 0xffaaaaaa;
			FlxG.mouse.show();
			
			// Instantiate the item tracking array
			var size = AbstractPracticeProblem.SIZE;
			itemsTracker = new Array(size);
			for (var i = 0; i < size; i++) {
				itemsTracker[i] = new Array(size);
			}
			
			// Practice problem;
			//practiceProblem = new PracticeClass1();
			
			generateCircuitGrid();	
            add(generateInventoryView());
			

			
			super.create();
		}
		
		// Just static image for now
		private function generateCircuitGrid(): void {
			var background = new FlxSprite(0, 0, CircuitAssets.Screen);
			add(background);
		}
		
		// Load items from the Inventory and display it
		private function generateInventoryView(): FlxGroup {
			
			var inventoryView = new FlxGroup();
			
			for (var i = 0; i < Information.INVENTORY.getSize(); i++) {
				// Display the inventory item here
				// inventoryView.add(new FlxSprite(100, 100, CircuitAssets[Item.WIRE_HORIZONTAL]));
			}
			
			return inventoryView;
		}
		
		private function generateCircuitView():FlxGroup {
			var circuitView = new FlxGroup();
			
				var size = AbstractPracticeProblem.SIZE;
				for (int i = 0; i < size; i++) {
					for (int j = 0; j < size; j++) {
						var item:Item = practiceProblem.getItemAt(i, j);
						circuitView.add(new FlxSprite(i * 100, j * 100, CircuitAssets[item.name]);
					}
				}
			return circuitView;
		}
	}
}