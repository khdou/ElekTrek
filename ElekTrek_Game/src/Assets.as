package 
{
    import flash.utils.ByteArray;
    /**
     * Embeds and imports all assets for the game
     * @author Kevin
     */
    public class Assets
    {
		// backgrounds
		[Embed(source = "../assets/Homescreen/Homescreen-01-01.png")] public static var MENU_BACKGROUND:Class;
		
        // sprites
 		[Embed(source = "../assets/Characters/spaceman_spritesheet-01-01.png")] public static var OVERWORLD_SPACEMAN:Class;
		[Embed(source = "../assets/Characters/robotHead.png")] public static var ROBOT_HEAD:Class;
 		[Embed(source = "../assets/healthbar.png")] public static var HEALTH_BAR:Class;

		// tiles
 		[Embed(source = "../assets/Backgrounds/floortiles.png")] public static var FLOOR_TILE:Class;
 		[Embed(source = "../assets/Backgrounds/walltiles-01.png")] public static var WALL_TILE:Class;		
		
        // objects
 		[Embed(source = "../assets/Furnitures/computerscreen_medium.png")] public static var OVERWORLD_COMPUTER:Class;
 		[Embed(source = "../assets/Furnitures/small_table.png")] public static var OVERWORLD_TABLE:Class;
 		[Embed(source = "../assets/Furnitures/CIRCUIT_MEDIUM.png")] public static var DOOR_CIRCUIT:Class;

		[Embed(source = "../assets/Furnitures/doorAnimation.png")] public static var DOOR:Class;

 		[Embed(source = "../assets/Furnitures/flashlight.png")] public static var FLASHLIGHT:Class;
 		[Embed(source = "../assets/Furnitures/flashlightOn.png")] public static var FLASHLIGHT_ON:Class;
		
 		[Embed(source = "../assets/Furnitures/lightbulb_on.png")] public static var LIGHTBULB_ON:Class;
 		[Embed(source = "../assets/Furnitures/lightbulb_off.png")] public static var LIGHTBULB_OFF:Class;		
		
 		[Embed(source = "../assets/Furnitures/small_redlight.png")] public static var RING:Class;
 		[Embed(source = "../assets/Furnitures/portal thingy.png")] public static var CYLINDER:Class;

		
 		[Embed(source = "../assets/cutscene/scene1.png")] public static var SCENE1:Class;
 		[Embed(source = "../assets/cutscene/scene2.png")] public static var SCENE2:Class;
 		[Embed(source = "../assets/cutscene/scene3.png")] public static var SCENE3:Class;
		
 		[Embed(source = "../assets/Furnitures/djAnimate.png")] public static var BOX:Class;				
 		[Embed(source = "../assets/Furnitures/dashboard.png")] public static var DASHBOARD:Class;		
 		[Embed(source = "../assets/Furnitures/computerscreen_medium.png")] public static var COMPUTER:Class;
 		[Embed(source = "../assets/Furnitures/table_large.png")] public static var TABLE:Class;
 		[Embed(source = "../assets/Furnitures/trunk.png")] public static var TRUNK:Class;
 		[Embed(source = "../assets/Furnitures/Portal.png")] public static var PORTAL:Class;
		
//		[Embed(source="../assets/") public static var BACKGROUND_MUSIC_ELECTRONIC:Class;
		
    }
}