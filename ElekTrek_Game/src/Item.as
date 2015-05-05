package
{
	import org.flixel.*;
	
	/**
	 * This class encapsulate information of an item in the game
	 * 
	 * @author Tomit Huynh
	 */
	public class Item
	{
		public static const WIRE:int = 1;
		public static const RESISTOR:int = 2;
		public static const BATTERY:int = 3;
		
		public var type:int;
		public var value:Number; 
		public var description:String;
			
		/**
		 * 
		 * @param	type			Type of item, described by Item constant
		 * @param	value			Value of the item
		 * @param	description		Other information
		 */
		public function Item(type:int, value:Number=0,description:String='') 
		{
			this.type = type;
			this.value = value;
			this.description = description;
		}
	}
}