package
{
	import org.flixel.*;
	
	/**
	 * Wrapper class around an array to support the adding and removing of items.
	 */
	public class Inventory
	{
		// Backing data structure to keep track of the items in the inventory
		private static var items:Array;
		
		public function Inventory(): void {
			
			items = new Array();
			// some random values for now
			var num = 9;
			for (var i = 1; i < num; i++) {
				addItem(new Item(Item.RESISTOR_HORIZONTAL, i));
			}
			
			addItem(new Item(Item.BATTERY_VERTICAL, 1));
		}
		
		/**
		 * Add an item into the Inventory
		 * @param	item
		 */
		public function addItem(item:Item):void {
			items.push(item);
		}
		
		/**
		 * Get an item with the array's index
		 */
		public function getItem(index:int):Item {
			return items[index];
		}
		
		/**
		 * Remove an item from the array and return it
		 */
		public function removeItem(index:int):Item {
			var item = items[index];
			items.splice(index, 1);
			return item;
		}
		
		public static function getSize():int {
			return items.length;
		}
		
		public function getSize():int {
			return items.length;
		}
		
		/**
		 * Get an item with the array's index
		 */
		public static function getItem(index:int):Item {
			return items[index];
		}
	}
}