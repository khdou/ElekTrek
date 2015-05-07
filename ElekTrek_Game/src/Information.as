package 
{
	import org.flixel.*;	
	
	/**
	 * ...
	 * @author Kevin
	 */
	public class Information 
	{
		
		public static var X_LOCATION:Number=390;
		public static var Y_LOCATION:Number=210;
		public static var LEVEL:Number=1;		
		public static var REPAIR_STATUS:Number = 0;
		public static var INVENTORY:Inventory = new Inventory();
		
        /**
         * Constants
         */
        public static var LEVEL1_SIZE:FlxPoint = new FlxPoint(800, 600); // level size (in pixels)
        public static var LEVEL2_SIZE:FlxPoint = new FlxPoint(900, 600); // level size (in pixels)
		
        public static var BLOCK_SIZE:FlxPoint = new FlxPoint(30, 30); // block size (in pixels)		
		
		
		/**
		 * Current practice problem
		 */
		public static var CURRENT_PROBLEM:AbstractPracticeProblem = new PracticeClass0();
	}

}