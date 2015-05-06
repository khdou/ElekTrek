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
		public static const WIRE_HORIZONTAL:String = "WireHorizontal";
		public static const WIRE_VERTICAL:String = "WireVertical";
		public static const WIRE_CORNER1:String = "WireCorner1";
		public static const WIRE_CORNER2:String = "WireCorner2";
		public static const WIRE_CORNER3:String = "WireCorner3";
		public static const WIRE_CORNER4:String = "WireCorner4";
		public static const RESISTOR_HORIZONTAL:String = "ResistorHorizontal";
		public static const RESISTOR_VERTICAL:String = "ResistorVertical";
		public static const BATTERY_VERTICAL:String = "BatteryVertical";
		
		public var name:String;
		public var value:Number; 
		public var description:String;
			
		/**
		 * 
		 * @param	type			Type of item, described by Item constant
		 * @param	value			Value of the item
		 * @param	description		Other information
		 */
		public function Item(name:String, value:Number=-1,description:String='') 
		{
			this.name = name;
			this.value = value;
			this.description = description;
		}
		
		/**
		 * Return the unit of this item based on its type
		 * Battery has volts, wire has current so amp, 
		 */
		public function getUnit():String {
			var unit:String;
			
			switch(this.name.charAt(0)) {
				case "B":
					unit = "volt"
					break;
				case "W":
					unit = "amp"
					break;
				case "R":
					unit = "ohm"
					break;
				default:
					unit = "";
					break;
			}
			
			return unit;
		}
	}
}