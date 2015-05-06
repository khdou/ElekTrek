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
				LEVEL = new OverworldLevel1(this, Information.LEVEL1_SIZE, Information.BLOCK_SIZE);
			} else if (Information.LEVEL == 2) {
				LEVEL = new OverworldLevel2(this, Information.LEVEL2_SIZE, Information.BLOCK_SIZE);
			}
            add(LEVEL);			
        }
    }
}