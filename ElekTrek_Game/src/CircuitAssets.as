package 
{
	/**
	 * Organize embedded assets with AS3 "best practice"
	 * http://stackoverflow.com/questions/14549136/as3-embed-images-class-and-then-get-these-images-into-another-class
	 * @author Tomit Huynh
	 */
	public class CircuitAssets 
	{
		[Embed(source = "../assets/CircuitScreen/battery_vertical.png")] 
		public static var BatteryVertical:Class;
		
		[Embed(source = "../assets/CircuitScreen/Blackwire_bottomleftcorner.png")] 
		public static var WireCorner4:Class;
		
		[Embed(source = "../assets/CircuitScreen/Blackwire_bottomrightcorner.png")] 
		public static var WireCorner3:Class;
		
		[Embed(source = "../assets/CircuitScreen/Blackwire_topleftcorner.png")] 
		public static var WireCorner1:Class;
		
		[Embed(source = "../assets/CircuitScreen/Blackwire_toprightcorner.png")] 
		public static var WireCorner2:Class;
		
		[Embed(source = "../assets/CircuitScreen/Blackwire_horizontal.png")] 
		public static var WireHorizontal:Class;
		
		[Embed(source = "../assets/CircuitScreen/Blackwire_vertical.png")] 
		public static var WireVertical:Class;
		
		[Embed(source = "../assets/CircuitScreen/Lightbulb_horizontal.png")] 
		public static var LightBulbHorizontal:Class;
		
		[Embed(source = "../assets/CircuitScreen/Lightbulb_vertical.png")] 
		public static var LightBulbVertical:Class;
		
		[Embed(source = "../assets/CircuitScreen/Resistor_horizontal.png")] 
		public static var ResistorHorizontal:Class;
		
		[Embed(source = "../assets/CircuitScreen/Resistor_vertical.png")] 
		public static var ResistorVertical:Class;
		
		[Embed(source = "../assets/bluetile.JPG")] 
		public static var BlueTile:Class;
		
		[Embed(source = "../assets/redtile.JPG")] 
		public static var RedTile:Class;
		
		[Embed(source = "../assets/yellowtile.JPG")] 
		public static var YellowTile:Class;
		
		public function CircuitAssets() 
		{
			//nothing
		}
		
	}

}