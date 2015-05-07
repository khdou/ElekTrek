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
		protected var effectGroup:FlxGroup; // things without collisions		
		protected var objectGroup:FlxGroup; // objects and obstacles (with collisions)
		protected var circuitGroup0:FlxGroup; // switch to circuit interaction here
		
		protected var circuitGroup1:FlxGroup; // switch to circuit interaction here
		protected var circuitGroup2:FlxGroup; // switch to circuit interaction here
		
		protected var teleportGroup:FlxGroup; // switch to circuit interaction here

		/**
		 * Game objects
		 */
		protected var flashlight:FlxSprite;	
		protected var ring:Ring;				
		
		protected var computer:FlxSprite;		
		protected var table:FlxSprite;		
		protected var portal:FlxSprite;		
		protected var trunk:FlxSprite;	
		protected var door:Door;
		protected var doorCircuit:FlxSprite;
		var repairBar:FlxBar;		
		
        /**
         * Floor layer
         */
        protected static var FLOORS:Array = new Array(
			3,2,1,3,2,2,2,1,1,0,2,2,2,2,1,0,3,3,2,2,1,1,1,2,2,2,1,
			3,2,2,2,2,2,1,2,1,1,1,3,1,3,1,2,3,0,1,2,0,3,0,3,1,2,2,
			1,2,3,0,1,0,2,3,1,3,0,1,3,3,3,1,0,3,0,1,2,1,1,1,0,0,2,
			3,3,2,2,1,2,0,3,2,5,3,0,2,3,1,0,2,2,1,4,4,2,0,5,2,2,3,
			3,0,2,3,3,5,2,2,0,3,2,2,3,2,2,2,1,2,3,1,3,0,5,1,2,1,2,
			3,2,0,1,0,5,2,2,0,2,2,2,3,0,3,1,0,3,0,0,0,2,2,2,1,1,2,
			3,2,2,3,3,2,0,1,4,5,5,0,1,2,1,2,2,0,0,3,1,2,1,4,1,3,1,
			3,3,2,2,4,0,3,1,2,2,3,0,2,3,0,2,4,4,2,0,3,0,1,2,0,0,0,
			3,3,3,1,3,2,0,3,3,2,0,0,3,1,3,0,0,2,3,3,3,0,0,2,1,0,3,
			1,1,3,3,0,0,0,1,1,0,0,0,1,3,1,0,3,3,0,0,4,4,3,1,2,2,1,
			2,3,3,0,0,0,1,0,2,7,1,1,1,3,3,3,3,3,3,0,2,0,0,2,3,1,3,
			2,3,3,1,5,2,2,1,4,1,3,0,3,5,3,3,1,0,3,0,1,0,1,3,1,0,0,
			1,1,2,0,0,3,0,3,1,1,0,2,2,3,2,0,1,3,3,3,3,1,2,2,2,3,3,
			3,1,2,0,1,4,0,2,0,1,0,2,3,2,5,2,5,2,0,2,0,2,0,2,0,2,3,
			0,3,2,3,3,2,3,3,5,0,3,0,2,4,2,3,1,1,0,3,0,3,2,2,2,1,1,
			0,1,1,1,4,2,0,3,5,0,1,3,2,3,3,0,3,1,3,2,0,0,2,1,0,0,2,
			0,2,2,3,0,4,3,1,0,1,1,2,1,0,1,2,4,2,0,5,0,4,3,5,1,3,0,
			3,1,2,0,0,3,0,2,2,1,0,1,1,0,3,3,2,3,1,3,1,0,0,1,0,1,3,
			1,0,2,2,2,1,2,2,1,1,2,2,0,2,3,0,1,4,0,1,3,2,1,0,1,2,3,
			1,0,2,1,3,3,2,1,3,2,2,1,2,1,1,2,3,2,1,3,2,0,2,1,0,3,3
        );
         
        /**
         * Wall layer
         */
        protected static var WALLS:Array = new Array(
			3,1,2,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,3,1,2,
			2,3,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,3,1,
			1,2,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,2,3,
			3,1,2,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,3,1,2,
			2,3,1,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,4,5,6,4,5,6,4,5,6,0,0,0,0,5,6,4,5,6,4,5,6,2,3,1
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
         * Create the player, bullets, etc
         */
        override protected function createPlayer():void {
			
            player = new Spaceman(Information.X_LOCATION,Information.Y_LOCATION);
        }		
		
        /**
         * Create the map (walls, decals, etc)
         */
        override protected function createMap():void {
            var tiles:FlxTilemap;
            // floors
            tiles = new FlxTilemap();
            tiles.loadMap(
                FlxTilemap.arrayToCSV(FLOORS, 27), // convert our array of tile indices to a format flixel understands
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
                FlxTilemap.arrayToCSV(WALLS, 27), // convert our array of tile indices to a format flixel understands
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
			effectGroup = new FlxGroup();
			
			objectGroup = new FlxGroup();
			circuitGroup0 = new FlxGroup();
			circuitGroup1 = new FlxGroup();
			circuitGroup2 = new FlxGroup();
			teleportGroup = new FlxGroup();
			
			if (Information.REPAIR_STATUS < 50) {
				flashlight = new FlxSprite(
					14 * tileSize.x, // x location
					14 * tileSize.y, // y location 
					Assets.FLASHLIGHT // image to use
				);
				flashlight.immovable = true;
				circuitGroup0.add(flashlight)
				
				ring = new Ring(14 * tileSize.x-7.5,
								14 * tileSize.y-7.5);
				ring.immovable = true;
				effectGroup.add(ring);					
			} else {
				flashlight = new FlxSprite(
					14 * tileSize.x, // x location
					14 * tileSize.y-11, // y location 
					Assets.FLASHLIGHT_ON // image to use
				);
				flashlight.immovable = true;
				objectGroup.add(flashlight)
			}
			
			if (Information.REPAIR_STATUS < 50) {
				doorCircuit = new FlxSprite(
					10 * tileSize.x, // x location
					19 * tileSize.y-1, // y location 
					Assets.DOOR_CIRCUIT // image to use
				);
				doorCircuit.immovable = true;
				circuitGroup1.add(doorCircuit)
							
			} else {
				doorCircuit = new FlxSprite(
					10 * tileSize.x, // x location
					19 * tileSize.y-1, // y location 
					Assets.DOOR_CIRCUIT // image to use
				);
				doorCircuit.immovable = true;
				circuitGroup1.add(doorCircuit)
				
				ring = new Ring(10 * tileSize.x-7.5,
								19 * tileSize.y-7.5);
				ring.immovable = true;
				effectGroup.add(ring);
			}
			
			door = new Door(12 * tileSize.x,
							19 * tileSize.y);
			door.immovable = true;
			teleportGroup.add(door);
			
		}		
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		override protected function addGroups():void {
			add(floorGroup);
			add(wallGroup);
			add(objectGroup);
			add(effectGroup);

			add(circuitGroup0);
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
			var instructions:FlxText = new FlxText(0, 0, 800, "Level 1 Progress: " + Information.X_LOCATION + " " + Information.Y_LOCATION);
			instructions.alignment = "center";
			instructions.size = 20;
			guiGroup.add(instructions);
			
			repairBar = new FlxBar(380, 30, FlxBar.FILL_LEFT_TO_RIGHT);
			repairBar.createImageBar(null, Assets.HEALTH_BAR, 0x88000000);
			guiGroup.add(repairBar);			
		}		
		
		/**
		 * Update each timestep
		 */
		override public function update():void {
			super.update(); // NOTE: map -> player collision happens in super.update()
			FlxG.collide(objectGroup, player);
			FlxG.collide(teleportGroup, player);
			
			if (Information.REPAIR_STATUS < 50) {
				if (FlxG.overlap(player, circuitGroup0)) {
					Information.CURRENT_PROBLEM = new PracticeClass0();
					FlxG.switchState(new CircuitInteractionState);
				}
			} else if (Information.REPAIR_STATUS < 100) {
				if (FlxG.overlap(player, circuitGroup1)) {
					Information.CURRENT_PROBLEM = new PracticeClass1();
					FlxG.switchState(new CircuitInteractionState);
				}
			} else {
				if (FlxG.overlap(player, teleportGroup)) {
					door.animate();
					Information.LEVEL = 2;
					FlxG.switchState(new OverworldState);
				}
			}
		
			repairBar.percent = Information.REPAIR_STATUS;
		}		
    }
}