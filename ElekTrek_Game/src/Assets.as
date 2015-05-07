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
		[Embed(source = "../assets/Homescreen/Homescreen-01.png")] public static var MENU_BACKGROUND:Class;
		
        // sprites
 		[Embed(source = "../assets/Characters/spaceman_spritesheet-01-01.png")] public static var OVERWORLD_SPACEMAN:Class;
 		[Embed(source = "../assets/healthbar.png")] public static var HEALTH_BAR:Class;

		// tiles
 		[Embed(source = "../assets/Backgrounds/floortiles.png")] public static var FLOOR_TILE:Class;
 		[Embed(source = "../assets/temp_wallTile.png")] public static var WALL_TILE:Class;		
		
        // objects
 		[Embed(source = "../assets/Furnitures/computerscreen_medium.png")] public static var OVERWORLD_COMPUTER:Class;
 		[Embed(source = "../assets/Furnitures/small_table.png")] public static var OVERWORLD_TABLE:Class;

		[Embed(source = "../assets/Furnitures/doorAnimation.png")] public static var DOOR:Class;

 		[Embed(source = "../assets/Furnitures/flashlight.png")] public static var FLASHLIGHT:Class;
 		[Embed(source = "../assets/Furnitures/small_redlight.png")] public static var RING:Class;

		
 		[Embed(source = "../assets/Furnitures/computerscreen_medium.png")] public static var COMPUTER:Class;
 		[Embed(source = "../assets/Furnitures/table_large.png")] public static var TABLE:Class;
 		[Embed(source = "../assets/Furnitures/trunk.png")] public static var TRUNK:Class;
 		[Embed(source = "../assets/Furnitures/Portal.png")] public static var PORTAL:Class;
		
    }
}