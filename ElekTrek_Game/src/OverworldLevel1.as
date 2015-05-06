package 
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	/**
	 * ...
	 * @author Kevin 
	 */
	public class OverworldLevel1 extends AbstractOverworld 
    {
		
		/**
		 * Custom groups
		 */
		protected var objectGroup:FlxGroup; // objects and obstacles (with collisions)
		protected var circuitGroup1:FlxGroup; // switch to circuit interaction here
		protected var circuitGroup2:FlxGroup; // switch to circuit interaction here
		
		protected var teleportGroup:FlxGroup; // switch to circuit interaction here

		/**
		 * Game objects
		 */
		protected var computer:FlxSprite;		
		protected var table:FlxSprite;		
		protected var portal:FlxSprite;		
		protected var trunk:FlxSprite;		
		var repairBar:FlxBar;		
        /**
         * Floor layer
         */
        protected static var FLOORS:Array = new Array(
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        );
         
        /**
         * Wall layer
         */
        protected static var WALLS:Array = new Array(
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
            2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
        );
         
        /**
         * Constructor
         * @param   state       State displaying the level
         * @param   levelSize   Width and height of level (in pixels)
         * @param   blockSize   Default width and height of each tile (in pixels)
         */
        public function OverworldLevel1(state:FlxState, levelSize:FlxPoint, blockSize:FlxPoint):void {
            super(state, levelSize, blockSize);
        }
         
        /**
         * Create the map (walls, decals, etc)
         */
        override protected function createMap():void {
            var tiles:FlxTilemap;
            // floors
            tiles = new FlxTilemap();
            tiles.loadMap(
                FlxTilemap.arrayToCSV(FLOORS, 30), // convert our array of tile indices to a format flixel understands
                Assets.FLOOR_TILE, // image to use
                tileSize.x, // width of each tile (in pixels)
                tileSize.y, // height of each tile (in pixels)
                0, // don't use auto tiling (needed so we can change the rest of these values)
                0, // starting index for our tileset (0 = include everything in the image)
                0, // starting index for drawing our tileset (0 = every tile is drawn)
                uint.MAX_VALUE // which tiles allow collisions by default (uint.MAX_VALUE = no collisions)
            );
            floorGroup.add(tiles);
            // walls
            tiles = new FlxTilemap();
            tiles.loadMap(
                FlxTilemap.arrayToCSV(WALLS, 30), // convert our array of tile indices to a format flixel understands
                Assets.WALL_TILE, // image to use
                tileSize.x, // width of each tile (in pixels)
                tileSize.y // height of each tile (in pixels)
            );
            wallGroup.add(tiles);
			// objects
			createObjects();	
        }
		
		 
		/**
		 * Add all the objects, obstacles, etc to the level
		 */
		protected function createObjects():void {
			var sprite:FlxSprite;
			// create custom groups
			objectGroup = new FlxGroup();
			circuitGroup1 = new FlxGroup();
			circuitGroup2 = new FlxGroup();
			teleportGroup = new FlxGroup();
			
			computer = new FlxSprite(
				11 * tileSize.x, // x location
				5 * tileSize.y, // y location 
				Assets.COMPUTER // image to use
			);
			computer.immovable = true; // don't allow the player to move this object
			objectGroup.add(computer);
			
			trunk = new FlxSprite(
				10 * tileSize.x, // x location
				5 * tileSize.y, // y location 
				Assets.TRUNK // image to use
			);
			trunk.immovable = true; // don't allow the player to move this object
			circuitGroup2.add(trunk);	
			
			table = new FlxSprite(
				15 * tileSize.x, // x location
				2 * tileSize.y, // y location 
				Assets.TABLE // image to use
			);
			table.immovable = true; // don't allow the player to move this object
			circuitGroup1.add(table);			
			
			portal = new FlxSprite(
				1 * tileSize.x, // x location
				2 * tileSize.y, // y location 
				Assets.PORTAL // image to use
			);
			portal.immovable = true; // don't allow the player to move this object
			teleportGroup.add(portal);				
		}		
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		override protected function addGroups():void {
			add(floorGroup);
			add(wallGroup);
			add(objectGroup);
			add(circuitGroup1);
			add(circuitGroup2);
			add(teleportGroup);
			add(player);
			add(guiGroup);
		}

		/**
		 * Create text, buttons, indicators, etc
		 */
		override protected function createGUI():void {
			var instructions:FlxText = new FlxText(0, 0, 800, "Level1");
			instructions.alignment = "center";
			instructions.size = 20;
			guiGroup.add(instructions);
			
			repairBar = new FlxBar(450, 10, FlxBar.FILL_LEFT_TO_RIGHT);
			repairBar.createImageBar(null, Assets.HEALTH_BAR, 0x88000000);
			guiGroup.add(repairBar);			
		}		
		
		/**
		 * Update each timestep
		 */
		override public function update():void {
			super.update(); // NOTE: map -> player collision happens in super.update()
			FlxG.collide(objectGroup, player);
			if (FlxG.overlap(player, circuitGroup1)) {
				Information.CURRENT_PROBLEM = new PracticeClass0();
				FlxG.switchState(new CircuitInteractionState);
			}
			if (FlxG.overlap(player, circuitGroup2)) {
				Information.CURRENT_PROBLEM = new PracticeClass1();
				FlxG.switchState(new CircuitInteractionState);
			}			
			if (FlxG.overlap(player,teleportGroup)) {
				Information.LEVEL = 2;
				FlxG.switchState(new OverworldState);
			}
			repairBar.percent = Information.REPAIR_STATUS;
		}		
    }
}