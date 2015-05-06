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
	 * Such as what circuit puzzle problem it is. This can be think 
	 * of as the View from the MVC model. Inventory and Practice is 
	 * the Collection
	 * 
	 * @author Tomit Huynh
	 */
	public class CircuitInteractionState extends FlxState
	{
		private var itemsTracker:Array; // Tracking the item in the grid using 2D array. [row][col]
		private var practiceProblem:AbstractPracticeProblem;
		
		private var inventoryView:FlxGroup;	// Hold all the FlxSprite to be render for the inventory
		private var circuitView:FlxGroup;	// Hold all the FlxSprite to be render for the circuit
		private var textArea:FlxText;
		
		private var _currDragItem;		// Track the item being drag
		private var _currFlxSprite;		// Track the graphic rep of _currDragItem
		
		/**
		 * Similar to the constructor, FlxG call this after FlxG.switchState() is done
		 */
		override public function create(): void{
			
			// Fix a weird bug from Flixel Power Tools library
			if (FlxG.getPlugin(FlxMouseControl) == null)
			{
				FlxG.addPlugin(new FlxMouseControl);
			}
			
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
			
			// Storing these group to remove them in updates
            inventoryView = generateInventoryView();
			circuitView = generateCircuitView();
			add(inventoryView);
			add(circuitView);

			
			super.create();
		}
		
		// Just static image for now
		private function loadBackground(): void {
			var background = new FlxSprite(0, 0, CircuitAssets.Screen);
			add(background);
			textArea = new FlxText(80, 20, 700, "Welcome to the CircuitInteraction!");
			add(textArea);
			
			textArea.color = FlxColor.getColor32(255, 60, 60, 60);
			textArea.size = 10;
		}
		
		/**
		 * Load items from the Inventory and display it
		 * @return FlxGroup of items to display
		 */ 
		private function generateInventoryView(): FlxGroup {
			
			var inventoryView = new FlxGroup();
			
			for (var i:int = 0; i < Information.INVENTORY.getSize(); i++) {
				// Adding items in the inventory corresponding to the CircuitAssetts.Screen coordinate
				var item:Item = Information.INVENTORY.getItem(i);
				
				// Setup mouseDrag for this Sprite. 
				// On mouseDown, remove the item:Item from the Inventory
				// On mouseUp, add this item:Item to :
				// 		1) Inventory -- if the mouseCoordiate is outside the CircuitView boundary
				//		2) PracticeProblem.itemContainer -- if the mouseCoordiate is inside CircuitView boundary
				
				var draggableSprite = new SpecialFlxSprite(568 + (i % 3 * 75), 139 + (i / 3 * 90), CircuitAssets["med" + item.name]);
				var infoText = new FlxText( 568 + (i % 3 * 75), 199 + (i / 3 * 90), 70, item.value == -1 ? "" : item.value + " " + item.getUnit() );
				inventoryView.add(draggableSprite);
				inventoryView.add(infoText);
				
				draggableSprite.inventoryID = i; 		// Need to save this because of AS dynamic binding
				draggableSprite.itemName = item.name; 	// Saving this for later use too
				
				draggableSprite.enableMouseDrag(false,true);
				
				// On MouseDown
				draggableSprite.mousePressedCallback = function(obj:SpecialFlxSprite, x:int, y:int) {
					textArea.text = "Mouse Pressed at: x " + FlxG.mouse.x + ",y " + FlxG.mouse.y;
					obj.loadGraphic(CircuitAssets[obj.itemName]);
					_currDragItem = Information.INVENTORY.removeItem(obj.inventoryID);
					_currFlxSprite = obj;
					inventoryView.remove(obj); // Detach this item from the Inventory view
					add(obj); // add it to the state
				}
				
				// On MouseUp
				draggableSprite.mouseReleasedCallback = function(obj:FlxExtendedSprite, x:int, y:int) {
					
					textArea.text = "Mouse Pressed at: x " + FlxG.mouse.x + ",y " + FlxG.mouse.y;
					
					if (y < 400 && x > 300) {
						// Within circuitView boundary, should have a better way for this
						// @TODO Store the practiceProblem's itemContainer
						remove( _currFlxSprite );
						
						// run animation, check practiceProblem.isCorrect()
					}else {
						// Return to the inventory
						Information.INVENTORY.addItem(_currDragItem);
					}
					remove( _currFlxSprite );		// Detach this item from the Inventory view
				}
				
				
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
							if (practiceProblem.isOriginalPieces(new Coordinate(i, j))) {
								// Not draggable
								circuitView.add(new FlxSprite(20+ j * 100, 83 + i * 100, CircuitAssets[item.name]));
							}else {
								// Draggable
								// Define dropping area
								var draggable = new SpecialFlxSprite(20 + j * 100, 83 + i * 100, CircuitAssets[item.name]);
								draggable.enableMouseDrag();
								
								circuitView.add(draggable);
							}
						}
					}
				}
			return circuitView;
		}
		
		/**
		 * @TODO 
		 * Translate the screen X,Y coordinate to the Practice Problem [row][col]
		 * 
		 * @param	screenX		The mouseX position on the screen 
		 * @param	screenY		The mouseY position on the screen 
		 * @return	A corresponding [row][col] value for the PracticeProblem. If screen coordinate is invalid, returns [-1][-1]
		 */
		private function translateCoordinateForPracticeProblem(screenX:int, screenY:int):Coordinate {
			// validate coordinate
			return new Coordinate(-1,-1);
		}
		
		private function playSuccessAnimation():void {
			
		}
		
		/**
		 * Handle some Sprite drop before updating
		 */
		override public function update():void
		{
			// REgenerate circuitView and inventoryView here to reflect change in data
			remove(inventoryView);
			remove(circuitView);
            inventoryView = generateInventoryView();
			circuitView = generateCircuitView();
			add(inventoryView);
			add(circuitView);
			
			super.update();
		}
	}
}