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
		
		private var inventoryView:FlxGroup;
		private var CircuitView:FlxGroup;
		
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
			practiceProblem = new PracticeClass1();
			
			loadBackground();
			
			//
            inventoryView = generateInventoryView());
			add(generateCircuitView());
			

			
			super.create();
		}
		
		// Just static image for now
		private function loadBackground(): void {
			var background = new FlxSprite(0, 0, CircuitAssets.Screen);
			add(background);
		}
		
		/**
		 * Load items from the Inventory and display it
		 * @return FlxGroup of items to display
		 */ 
		private function generateInventoryView(): FlxGroup {
			
			var inventoryView = new FlxGroup();
			
			for (var i = 0; i < Information.INVENTORY.getSize(); i++) {
				// Adding items in the inventory corresponding to the CircuitAssetts.Screen coordinate
				var item:Item = Information.INVENTORY.getItem(i);
				
				// @Jason 
				// Setup mouseDrag for this Sprite. 
				// On mouseDown, remove the item:Item from the Inventory
				// On mouseUp, add this item:Item to :
				// 		1) Inventory -- if the mouseCoordiate is outside the CircuitView boundary
				//		2) PracticeProblem.itemContainer -- if the mouseCoordiate is inside CircuitView boundary
				// 
				// 		
				inventoryView.add(new FlxSprite(540 + (i%3 * 90), 139 + (i/3 * 90), CircuitAssets[item.name]));
			}
			
			return inventoryView;
		}
		
		/**
		 * Load items from Practice Problems
		 * @return
		 */
		private function generateCircuitView():FlxGroup {
			var circuitView = new FlxGroup();
			
				var size = AbstractPracticeProblem.SIZE;
				for (var i = 0; i < size; i++) {
					for (var j = 0; j < size; j++) {
						var item:Item = practiceProblem.getItemAt(i, j);
						if (item != null) {
							if (
							// Not draggable
							circuitView.add(new FlxSprite(j * 100, 100 + i * 100, CircuitAssets[item.name]));
						}
						
					}
				}
			return circuitView;
		}
		
		/**
		 * Handle some Sprite drop before updating
		 */
		override public function update():void
		{
			// @Jason
			// REgenerate circuitView and inventoryView here to reflect change in data
			super.update();
		}
	}
}