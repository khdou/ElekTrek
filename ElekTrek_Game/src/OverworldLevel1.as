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
		protected var flashlighton:FlxSprite;	
		
		protected var ring:Ring;				

		protected var box1:FlxSprite;		
		protected var box2:FlxSprite;		

		protected var trunk1:FlxSprite;	
		protected var trunk2:FlxSprite;	
		
		protected var cylinder:FlxSprite;		
	
		protected var dashboard:FlxSprite;		
		protected var computer:FlxSprite;		
		protected var table:FlxSprite;		
		protected var portal:FlxSprite;		
		protected var door:Door;
		protected var doorCircuit:FlxSprite;
		protected var repairBar:FlxBar;		
		
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
			3,1,2,5,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,4,5,3,1,2,
			2,3,1,6,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,4,2,3,1,
			1,2,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,6,1,2,3,
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
			2,3,1,4,5,6,4,5,6,4,5,6,4,0,0,0,0,6,4,5,6,4,5,6,2,3,1
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
			
			box1 = new Box(3 * tileSize.x,
						   7 * tileSize.y);
			box1.immovable = true;
			objectGroup.add(box1);
			
			dashboard = new FlxSprite(
				5 * tileSize.x+5, // x location
				3 * tileSize.y, // y location 
				Assets.DASHBOARD // image to use
			);
			dashboard.immovable = true;
			objectGroup.add(dashboard);
			
			table = new FlxSprite(
				20 * tileSize.x,
				11 * tileSize.y,
				Assets.TABLE);
			table.immovable = true;
			objectGroup.add(table);
			
			trunk1 = new FlxSprite(
				4 * tileSize.x,
				13 * tileSize.y,
				Assets.TRUNK);
			trunk1.immovable = true;
			objectGroup.add(trunk1);
			
			trunk2 = new FlxSprite(
				4 * tileSize.x,
				16 * tileSize.y,
				Assets.TRUNK);
			trunk2.immovable = true;
			objectGroup.add(trunk2);

			cylinder = new FlxSprite(
				22 * tileSize.x,
				15 * tileSize.y,
				Assets.CYLINDER);
			cylinder.immovable = true;
			objectGroup.add(cylinder);			

			flashlight = new FlxSprite(
				14 * tileSize.x, // x location
				14 * tileSize.y, // y location 
				Assets.FLASHLIGHT // image to use
			);	
			flashlight.immovable = true;
			flashlighton = new FlxSprite(
				14 * tileSize.x, // x location
				14 * tileSize.y, // y location 
				Assets.FLASHLIGHT_ON // image to use
			);	
			flashlighton.immovable = true;
			doorCircuit = new FlxSprite(
				10 * tileSize.x, // x location
				19 * tileSize.y-1, // y location 
				Assets.DOOR_CIRCUIT // image to use
			);	
			doorCircuit.immovable = true;
			door = new Door(13 * tileSize.x,
							19 * tileSize.y);
			door.immovable = true;			
			if (Information.COMPLETION_STATUS < 50) {

				circuitGroup0.add(flashlight);
				objectGroup.add(doorCircuit);		
				objectGroup.add(door);
				
				ring = new Ring(14 * tileSize.x-7,
								14 * tileSize.y-7);
				ring.immovable = true;
				effectGroup.add(ring);				
			
			} else if (Information.COMPLETION_STATUS < 100) {

				objectGroup.add(flashlight);
				circuitGroup1.add(doorCircuit);
				objectGroup.add(door);				
				
				ring = new Ring(10.5 * tileSize.x-7.5,
								19 * tileSize.y-7.5);
				ring.immovable = true;
				effectGroup.add(ring);		
			
			} else {

				objectGroup.add(flashlight);
				objectGroup.add(doorCircuit)
				door.animate();
				teleportGroup.add(door);	
				
			}

		}		
		
		/**
		 * Decide the order of the groups. They are rendered in the order they're added, so last added is always on top.
		 */
		override protected function addGroups():void {
			add(floorGroup);
			add(wallGroup);
			add(objectGroup);

			add(circuitGroup0);
			add(circuitGroup1);
			add(circuitGroup2);
			add(teleportGroup);
			add(effectGroup);
			
			add(player);
			add(guiGroup);
		}

		/**
		 * Create text, buttons, indicators, etc
		 */
		override protected function createGUI():void {
			var instructions:FlxText = new FlxText(0, 0, 800, "Level 1 Progress:");
			instructions.alignment = "center";
			instructions.size = 20;
			guiGroup.add(instructions);
			
			repairBar = new FlxBar(300, 40, FlxBar.FILL_LEFT_TO_RIGHT,200,25,null,"",0,100,true);
			guiGroup.add(repairBar);			
		}		
		
		/**
		 * Update each timestep
		 */
		override public function update():void {
			super.update(); // NOTE: map -> player collision happens in super.update()
			FlxG.collide(objectGroup, player);
			
			if (FlxG.overlap(player, circuitGroup0)) {
				Information.CURRENT_PROBLEM = new PracticeClass0();
				FlxG.switchState(new CircuitInteractionState);
			}
			if (FlxG.overlap(player, circuitGroup1)) {
				Information.CURRENT_PROBLEM = new PracticeClass1();
				FlxG.switchState(new CircuitInteractionState);
			}
			if (FlxG.overlap(player, teleportGroup)) {
				Information.LEVEL = 2;
				Information.COMPLETION_STATUS = 0;
				Information.X_LOCATION = 180;
				Information.Y_LOCATION = 90;
				FlxG.switchState(new OverworldState);
			}
		
			repairBar.percent = Information.COMPLETION_STATUS;
		}		
    }
}