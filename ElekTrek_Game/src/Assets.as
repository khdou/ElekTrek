package 
{
    import flash.utils.ByteArray;
    /**
     * Embeds and imports all assets for the game
     * @author Cody Sandahl
     */
    public class Assets
    {
		// backgrounds
		[Embed(source = "../assets/temp_menu.png")] public static var MENU_BACKGROUND:Class;

		
        // sprites
 		[Embed(source = "../assets/temp_spaceman.png")] public static var OVERWORLD_SPACEMAN:Class;

        // tiles
 		[Embed(source = "../assets/computerscreen_medium.png")] public static var OVERWORLD_COMPUTER:Class;
 		[Embed(source = "../assets/small_table.png")] public static var OVERWORLD_TABLE:Class;
 		[Embed(source = "../assets/temp_floorTile.png")] public static var FLOOR_TILE:Class;
 		[Embed(source = "../assets/temp_wallTile.png")] public static var WALL_TILE:Class;
 		[Embed(source = "../assets/computerscreen_medium.png")] public static var COMPUTER:Class;
 		[Embed(source = "../assets/table_large.png")] public static var TABLE:Class;
		
    }
}