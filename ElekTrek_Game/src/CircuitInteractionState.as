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
	 * There are two major interaction in this state, user dragging
	 * from the circuitView and the inventoryView. MouseUp and 
	 * MouseDown are significant event
	 * 
	 * @author Tomit Huynh
	 */
	public class CircuitInteractionState extends FlxState
	{
		private var itemsTracker:Array; // Tracking the item in the grid using 2D array. [row][col]
		private var practiceProblem:AbstractPracticeProblem;
		
		private var inventoryView:FlxGroup;	// Hold all the FlxSprite to be render for the inventory
		private var circuitView:FlxGroup;	// Hold all the FlxSprite to be render for the circuit
		
		private var dialogView:FlxGroup;
		private var _dialogMessage:String;
		private var _showDialog: Boolean;
		
		private var textArea:FlxText;
		
		private var _currDragItem:Item;		// Track the item being drag
		private var _currFlxSprite;		// Track the graphic rep of _currDragItem
		
		private var backButton:FlxExtendedSprite; // Go back to overworld
		private var robotHead:FlxExtendedSprite; 
		
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
			var size:int = AbstractPracticeProblem.SIZE;
			itemsTracker = new Array(size);
			for (var i:int = 0; i < size; i++) {
				itemsTracker[i] = new Array(size);
			}
			
			// Practice problem;
			practiceProblem = Information.CURRENT_PROBLEM;
			//practiceProblem = new PracticeClass4();
			
			setupMiscellaneous();
			makeRobotSay(practiceProblem.getProblemText());
			
			// Storing these group to remove them in updates
            inventoryView = generateInventoryView();
			circuitView = generateCircuitView();
			add(inventoryView);
			add(circuitView);

			
			super.create();
		}
		
		// Just static image for now
		private function setupMiscellaneous(): void {
			var background = new FlxSprite(0, 0, CircuitAssets.Screen);
			add(background);
			textArea = new FlxText(80, 20, 600, "Welcome to the CircuitInteraction!");
			add(textArea);
			
			textArea.color = FlxColor.getColor32(255, 60, 60, 60);
			textArea.size = 10;
			
			backButton = new FlxExtendedSprite(5, 7, CircuitAssets.BackButton);
			backButton.loadGraphic(CircuitAssets.BackButton, false, false, 55, 45);
			backButton.addAnimation("OFF", [0]);
			backButton.addAnimation("HIGHLIGHT",[0,1],2,true);
			backButton.enableMouseClicks(true);
			backButton.mouseReleasedCallback = function() {
				exitCircuitInteractionState();
			}
			add(backButton);
			
			// Add RobotHead
			robotHead = new FlxExtendedSprite(705, 12, Assets.ROBOT_HEAD);
			add(robotHead);
			robotHead.loadGraphic(Assets.ROBOT_HEAD, false, false, 60, 50);
			robotHead.addAnimation("OFF", [0]);
			robotHead.addAnimation("HIGHLIGHT",[0,1],2,true);
			
			// Play background music
			FlxG.stream("../assets/sounds/ElectronicDrums.mp3", 1, true);
			
			// Add dialog box
			var message:String = practiceProblem.getDialogue();
			if (message.length > 0)
				showDialogWithMessage(message);
			
			for each (var cc:Coordinate in practiceProblem.missingCoord) {
				add(new FlxSprite(20 + cc.Y * 100, 83 + cc.X * 100, CircuitAssets["RedSquare"]));
			}
			
		}
		
		private function showDialogWithMessage(message:String) {
			_dialogMessage = message;
			_showDialog = true;
			add( dialogView = generateDialogView() );
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
				
				var draggableSprite = new SpecialFlxSprite(568 + (i % 3 * 77), 130 + (int(i / 3) * 90), CircuitAssets["med" + item.name]);
				var infoText = new FlxText( 558 + (i % 3 * 77), 190 + (int(i / 3) * 90), 70, item.value == -1 ? "" : item.value + " " + item.getUnit() );
				
				inventoryView.add(draggableSprite);
				inventoryView.add(infoText);
				
				draggableSprite.relativeLocale = i; 		// Need to save this because of AS dynamic binding
				draggableSprite.itemName = item.name; 		// Saving this for later use too
				
				draggableSprite.enableMouseDrag(false,true);
				
				// On MouseDown
				draggableSprite.mousePressedCallback = function(obj:SpecialFlxSprite, x:int, y:int) {
					obj.loadGraphic(CircuitAssets[obj.itemName]);
					_currDragItem = Information.INVENTORY.removeItem(obj.relativeLocale);
					_currFlxSprite = obj;
					inventoryView.remove(obj); // Detach this item from the Inventory view
					add(obj); // add it to the state
				}
				
				// On MouseUp
				draggableSprite.mouseReleasedCallback = onMouseReleased;
				
			}
			
			return inventoryView;
		}
		
		private function generateDialogView():FlxGroup {
			var dialogView = new FlxGroup();
			dialogView.add(new FlxSprite(200, 200).makeGraphic(400, 200, FlxColor.getColor32(255,72, 100, 157)));
			dialogView.add(new FlxText( 210, 210, 380, _dialogMessage));
			dialogView.add(new FlxButton( 400, 350, "OK", function() {
				_showDialog = false;
			}));
			return dialogView;
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
							
							// Load graphic manually on Spritesheet
							var sprite:SpecialFlxSprite = new SpecialFlxSprite(20 + j * 100, 83 + i * 100);
							sprite.loadGraphic(CircuitAssets[item.name], false, false, 100, 100);
							
							// Need to save this because of AS dynamic binding
							sprite.relativeLocale = new Coordinate(i, j);
							// Saving this for later use too
							sprite.itemName = item.name; 
							
							if (item.state != Item.STATE_OFF) {
								Item.loadFlxSpriteAnimationOn(sprite);
								sprite.play(item.name+Item.STATE_ON);
							}
							
							circuitView.add(sprite);
							
							// Gerate info for item with value (except wires)
							var infoText = new FlxText( 20 + j * 100, 93 + i * 100, 100, item.value == -1 || item.name.charAt(0) == "W" ? "" : item.value + " " + item.getUnit() );
 								infoText.size = 12;
 								circuitView.add(infoText);
							
							if (!practiceProblem.isOriginalPieces(new Coordinate(i, j))) {
								// Draggable
								// Define dropping area
								sprite.enableMouseDrag();
								
								sprite.mousePressedCallback = function(obj:SpecialFlxSprite, x:int, y:int) {
 									_currDragItem = practiceProblem.removeItemAt(obj.relativeLocale.X, obj.relativeLocale.Y);
 									_currFlxSprite = obj;
 									circuitView.remove(obj); // Detach this item from the Circuit view
 									add(obj); // add it to the state
 								}
 								
								sprite.mouseReleasedCallback = onMouseReleased;
								
							}
						}
					}
				}
			return circuitView;
		}
		
		
		/**
		 * Handle the component drop. If it is within the circuitView, it goes to to the practice
		 * problem.itemContainer. If not, it goes back to the inventory
		 * 
		 * @param	obj
		 * @param	x
		 * @param	y
		 */
		private function onMouseReleased (obj:FlxExtendedSprite, x:int, y:int):void {
					
			var coord:Coordinate = translateCoordinateForPracticeProblem(FlxG.mouse.x, FlxG.mouse.y);
			
			// Prevent player from dropping onto the original practice problem pieces
			var isModdingProblem = practiceProblem.isOriginalPieces(coord);
			
			if (coord.X != -1 && !isModdingProblem) {
				// Within circuitView boundary
				// Store the practiceProblem's itemContainer
				
				var prevItem = practiceProblem.insertItemAt( _currDragItem, coord.X, coord.Y);
				
				if (practiceProblem.isCorrect()) {
					
//					playSuccessAnimation();
					makeRobotSay("Success!");
					if (Information.CURRENT_PROBLEM.id == 0) {
						Information.COMPLETION_STATUS = 50;
					} else if (Information.CURRENT_PROBLEM.id == 1) {
						Information.COMPLETION_STATUS = 100;
					} else if (Information.CURRENT_PROBLEM.id == 2) {
						Information.COMPLETION_STATUS = 25;
					} else if (Information.CURRENT_PROBLEM.id == 3) {
						Information.COMPLETION_STATUS = 50;
					} else if (Information.CURRENT_PROBLEM.id == 4) {
						Information.COMPLETION_STATUS = 75;							
					}
				}
				else if (practiceProblem.isComplete()) {
					makeRobotSay(practiceProblem.getFeedback());
				}
				else {
					makeRobotSay(practiceProblem.getProblemText());
				}
				if (prevItem != null)
					Information.INVENTORY.addItem(prevItem);
					
				remove( _currFlxSprite );
				
			}
			else {
				// Return to the inventory
				Information.INVENTORY.addItem(_currDragItem);
			}
			
			if (!practiceProblem.isComplete() && !practiceProblem.isCorrect()) {
				makeRobotSay(practiceProblem.getProblemText());
			}
			
			/*if (practiceProblem.isCorrect()) {
				makeRobotSay("Success!");
			}else {
				makeRobotSay("Try again"); // Get some feedback from PracticeProblem
				
				var timer = new FlxDelay(2000);
				timer.start();
				if (timer.hasExpired)
				{
					makeRobotSay(practiceProblem.getProblemText());
				}
			}*/
			
			changeItemState(practiceProblem.isCorrect());
			remove( _currFlxSprite );		// Detach this item from the Inventory view
		}
		
		/**
		 * Translate the screen X,Y coordinate to the Practice Problem [row][col]
		 * 
		 * @param	screenX		The mouseX position on the screen 
		 * @param	screenY		The mouseY position on the screen 
		 * @return	A corresponding [row][col] value for the PracticeProblem. If screen coordinate is invalid, returns [-1][-1]
		 */
		private function translateCoordinateForPracticeProblem(screenX:int, screenY:int):Coordinate {
			// validate coordinate
			var j:int = int((screenX - 20) / 100)
			var i:int = int((screenY - 83) / 100)
			
			if (j > 4 || i > 4)	
				return new Coordinate(-1,-1);
				
			return new Coordinate(i,j);
		}
		
		/**
		 * Change item state to have component animated 
		 */
		private function changeItemState(correct:Boolean):void {
			
			var coords:Array = practiceProblem.getAnimatedLocations();
			for each (var c:Coordinate in coords) {
				practiceProblem.getItemAt(c.X, c.Y).state = correct ? Item.STATE_ON : Item.STATE_OFF;
			}
			
			if (correct) {
				backButton.play("HIGHLIGHT");
				robotHead.play("HIGHLIGHT");
			}else {
				backButton.play("OFF");
				robotHead.play("OFF");
			}
		}
		

		/**
		 * Save practice problem result and Switch back to OverWorld state
		 */
		private function exitCircuitInteractionState():void {
			for (var i = 0; i < AbstractPracticeProblem.SIZE; i++) {
				for (var j = 0; j < AbstractPracticeProblem.SIZE; j++) {
					if (practiceProblem.getItemAt(i, j) != null && !practiceProblem.isOriginalPieces(new Coordinate(i, j))) {
						Information.INVENTORY.addItem(practiceProblem.getItemAt(i, j));
						practiceProblem.insertItemAt(null, i, j);
					}
				}
			}
			FlxG.switchState(new OverworldState());
		}
		
		private function makeRobotSay(message:String) {
			textArea.text = "Hakenaji: " + message;
		}
		
		/**
		 * Handle some Sprite drop before updating
		 */
		override public function update():void
		{
			// REgenerate circuitView and inventoryView here to reflect change in data
			remove(inventoryView);
			remove(circuitView);
			remove(dialogView);
            inventoryView = generateInventoryView();
			circuitView = generateCircuitView();
			
			add(inventoryView);
			add(circuitView);
			
			
			if ( _showDialog ) {
				dialogView = generateDialogView();
				add(dialogView);
			}
			
			super.update();
		}
	}
}