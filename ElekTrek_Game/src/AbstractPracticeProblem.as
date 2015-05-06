package 
{
	/**
	 * ...
	 * @author Tomit Huynh
	 */
	public class AbstractPracticeProblem 
	{
		protected var itemContainer:Array;	// 2D array representing the [row][col] grid of all practice problem
		protected var missingCoord:Array; // Manage the missing spots to be checked
		public static const SIZE:int = 5;
		
		protected var config:Array;
		
		/**
		 * Initate the backing array
		 */
		public function AbstractPracticeProblem() 
		{
			// Intantiate the itemContainer
			itemContainer = new Array(SIZE);
			for (var i = 0; i < SIZE; i++) {
				itemContainer[i] = new Array(SIZE);
			}
		}
		
		/**
		 * Must be override to check emptyLocation in the itemContainer
		 */
		public function isCorrect():Boolean {
			return true;
		}
		
		/**
		 * Let the graphic interface insert an item at the empty spot
		 * 
		 * @param	item	Item to be inserted
		 * @param	row		row of the container
		 * @param	col		col of the container	
		 * @return	Item	Return the item that was previously at [row][col]
		 */
		public function insertItemAt(item:Item, row:int, col:int):Item {

			var i:Item = itemContainer[row][col];
			itemContainer[row][col] = item;
			return i;
			
			
			// Return an item if there is one in [row][col] and place in the new item
		}
		
		public function removeItemAt(row:int, col:int):Item {
			var i:Item = itemContainer[row][col];
			itemContainer[row][col] = null;	
			return i;
		}
		
		/**
		 * Check if this coordinate is part of the original pieces
		 * @param	coord
		 */
		public function isOriginalPieces(coord:Coordinate):Boolean {
			var isOriginal:Boolean = false;
			for each ( var cc:Coordinate in config) {
				if (cc.equals(coord)) {
					isOriginal = true;
					break;
				}
			}
			return isOriginal;
		}
		/**
		 * Get item information of this practice problem
		 * 
		 * @param	row
		 * @param	col
		 * @return 	Item at itemContainer[row][col]
		 */
		public function getItemAt(row:int, col:int):Item {
			return itemContainer[row][col];
		}
		
		/**
		 * Could validate problem at the creation stage to check if 
		 * itemContainer.missingCoord are null
		 */
		protected function validatePracticeProblem():Boolean {
			return true;
		}
		
		/**
		 * Grab the items from the Inventory in order to generate some problem
		 * Value should be present in the Inventory in order for the problem to
		 * have an answer
		 */
		protected function getItemsFromInventory():Array {
			return null;
		}
		
		/**
		 * Fill the item in itemContainer with randomly generated value 
		 * based on getValuesFromInventory
		 */
		protected function generateValues():void {
			
		}
		
		/**
		 * Return locations in coordinates to animate
		 */
		public function getAnimatedLocations():Array {
			return [];
		}
	}

}