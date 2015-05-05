package
{
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
		private var itemsTracker:Array; // Tracking the item in the grid using 2D array. [row][column]
		/**
		 * Similar to the constructor, FlxG call this after FlxG.switchState() is done
		 */
		override public function create(): void{
			FlxG.bgColor = 0xffaaaaaa;
			FlxG.mouse.show();
			
			// Instantiate the item tracking array
			var size = 5;
			itemsTracker = new Array(size);
			for (var i = 0; i < size; i++) {
				itemsTracker[i] = new Array(size);
			}
			
			generateCircuitGrid();	
            generateInventoryView();
			

			
			super.create();
		}
		
		// Just static image for now
		private function generateCircuitGrid(): void {
			var background = new FlxSprite(0, 0, CircuitAssets.Screen);
			add(background);
		}
		
		// Load items from the Inventory and display it
		private function generateInventoryView(): FlxSprite {
			for (var i = 0; i < Information.INVENTORY.getSize(); i++) {
				// Display the inventory item here
				
			}
		}
	}
}