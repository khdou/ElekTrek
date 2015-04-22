package 
{
    import org.flixel.*;
 
    /**
     * State for actually playing the game
     * @author Kevin
     */
    public class Overworld extends FlxState
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
            LEVEL = new OverworldFirstLevel(this, LEVEL_SIZE, BLOCK_SIZE);
            this.add(LEVEL);
        }
    }
}