package 
{
    import org.flixel.*;
 
    /**
     * State for actually playing the game
     * @author Kevin
     */
    public class OverworldState extends FlxState
    {
        /**
         * Constants
         */
        public static var LEVEL_SIZE:FlxPoint = new FlxPoint(900, 600); // level size (in pixels)
        public static var BLOCK_SIZE:FlxPoint = new FlxPoint(30, 30); // block size (in pixels)
         
        /**
         * Current level
         * NOTE: "public static" allows us to get info about the level from other classes
         */
        public static var LEVEL:AbstractOverworld = null;
         
        /**
         * Create state
         */
        override public function create():void {
            FlxG.mouse.show();
            // load level
			if (Information.LEVEL == 1) {
				LEVEL = new OverworldLevel1(this, LEVEL_SIZE, BLOCK_SIZE);
			} else if (Information.LEVEL == 2) {
				LEVEL = new OverworldLevel2(this, LEVEL_SIZE, BLOCK_SIZE);
			}
            this.add(LEVEL);
        }
    }
}