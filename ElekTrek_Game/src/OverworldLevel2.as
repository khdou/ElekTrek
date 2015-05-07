package 
{
	import mx.core.FlexSprite;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	/**
	 * ...
	 * @author Kevin 
	 */
	public class OverworldLevel2 extends AbstractOverworld 
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

		protected var lightbulb1:FlxSprite;
		protected var lightbulb2:FlxSprite;
		protected var lightbulb3:FlxSprite;
		protected var lightbulb1on:FlxSprite;
		protected var lightbulb2on:FlxSprite;
		protected var lightbulb3on:FlxSprite;		
		protected var robot:FlxSprite;		
		
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
			2,2,2,1,3,4,2,4,1,4,0,3,0,4,1,2,2,1,4,0,0,2,1,2,4,0,4,0,2,2,2,1,2,1,4,4,2,0,1,4,
			2,2,2,4,4,0,0,1,1,1,2,4,1,2,1,2,2,4,4,0,1,2,1,2,4,2,2,0,4,0,2,0,2,2,0,3,0,0,1,1,
			1,4,2,3,4,0,4,3,2,0,2,2,4,2,1,0,3,0,1,3,2,4,2,4,2,1,2,3,2,0,4,2,2,0,4,1,0,3,2,3,
			2,1,4,1,1,3,3,2,0,0,4,1,4,1,0,3,4,3,0,1,1,4,2,1,2,1,3,3,1,2,4,2,4,0,4,1,2,3,2,0,
			0,4,1,3,4,4,5,2,1,2,4,3,5,1,3,0,0,0,4,4,4,2,3,3,1,2,0,0,3,0,4,0,3,3,4,0,2,2,2,2,
			1,0,1,3,3,0,2,4,1,1,2,3,2,4,3,3,2,4,4,3,4,0,1,1,3,4,1,2,0,1,0,4,0,2,3,0,0,2,3,1,
			3,3,4,0,0,0,2,3,4,3,2,1,0,1,2,2,1,3,4,0,2,3,0,1,4,4,1,3,0,0,0,0,0,3,0,0,1,4,1,2,
			4,0,3,0,2,2,6,0,4,0,4,1,1,1,3,4,0,1,4,1,4,1,1,4,4,1,2,1,1,3,3,1,3,3,0,2,0,3,1,1,
			0,2,0,4,0,0,2,2,1,4,4,0,4,3,4,5,2,1,2,4,0,3,4,0,4,4,4,1,3,4,2,3,0,2,2,0,0,3,1,0,
			3,4,2,4,2,1,1,3,0,3,1,2,1,2,2,4,2,3,2,2,4,3,1,2,4,0,2,3,3,3,2,1,4,4,2,4,2,1,1,2,
			2,2,2,3,3,5,0,3,4,2,4,0,1,0,0,0,2,3,1,3,0,3,4,2,2,2,1,0,1,1,0,0,1,1,3,2,3,2,4,0,
			1,2,3,1,3,4,1,5,2,4,2,5,2,0,4,4,6,0,4,0,2,4,2,1,3,1,3,0,0,1,1,3,2,4,3,0,3,0,0,0,
			0,2,2,4,2,4,0,4,2,0,3,1,0,3,2,0,4,1,3,1,2,0,2,0,2,2,4,1,3,0,4,3,0,3,0,0,3,0,4,3,
			4,0,0,4,0,5,3,5,0,4,3,1,4,2,0,4,4,3,1,1,0,2,0,0,0,0,3,2,3,0,0,4,1,1,1,3,2,0,3,2,
			2,1,4,2,1,4,2,3,4,1,1,3,3,0,2,0,1,4,2,3,2,0,1,0,3,0,0,3,0,3,1,4,4,1,2,2,0,1,1,1,
			4,1,3,1,3,1,3,1,4,4,4,0,6,3,2,1,4,2,2,4,1,0,1,0,1,3,4,2,1,4,0,3,3,0,0,3,2,0,4,0,
			4,4,2,3,2,1,0,2,4,2,0,1,0,2,2,0,1,4,3,3,0,2,2,2,1,3,2,3,1,2,1,1,1,0,3,1,3,2,2,3,
			4,1,4,3,1,2,4,4,3,0,1,1,0,3,1,3,1,0,4,2,0,4,2,4,3,2,4,0,1,0,4,0,4,4,2,2,1,0,3,3,
			2,3,4,3,3,4,1,3,0,1,4,1,3,4,3,1,4,0,1,4,4,3,4,0,0,0,2,1,0,4,4,2,4,3,1,3,0,1,1,0,
			0,4,2,2,0,2,2,3,4,3,2,2,3,3,0,1,3,3,3,3,4,4,1,1,3,3,4,0,4,2,1,3,3,2,3,3,0,3,2,3

        );
         
        /**
         * Wall layer
         */
        protected static var WALLS:Array = new Array(
			3,1,2,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,4,5,6,3,1,2,
			2,3,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,6,4,5,6,3,1,
			1,2,6,4,5,0,0,0,0,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,4,5,6,4,2,3,
			3,1,2,5,6,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,6,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,2,3,1,
			1,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,1,2,3,
			3,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,5,6,0,0,0,0,0,0,0,0,0,3,1,2,
			2,3,1,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,5,6,4,4,5,6,2,3,1


        );
         
        /**
         * Constructor
         * @param   state       State displaying the level
         * @param   levelSize   Width and height of level (in pixels)
         * @param   blockSize   Default width and height of each tile (in pixels)
         */
        public function OverworldLevel2(state:FlxState, levelSize:FlxPoint, blockSize:FlxPoint):void {
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
                FlxTilemap.arrayToCSV(FLOORS, 40), // convert our array of tile indices to a format flixel understands
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
                FlxTilemap.arrayToCSV(WALLS, 40), // convert our array of tile indices to a format flixel understands
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

			door = new Door(5 * tileSize.x,
							2 * tileSize.y);
			door.immovable = true;
			if (Information.COMPLETION_STATUS==0) {
				door.close();
			}
			objectGroup.add(door);
			
			lightbulb1 = new FlxSprite(7 * tileSize.x,
							17 * tileSize.y,
							Assets.LIGHTBULB_OFF);
			lightbulb1.immovable = true;
			lightbulb1on = new FlxSprite(7 * tileSize.x,
							17 * tileSize.y,
							Assets.LIGHTBULB_ON);
			lightbulb1on.immovable = true;			
			lightbulb2 = new FlxSprite(20 * tileSize.x,
							10 * tileSize.y,
							Assets.LIGHTBULB_OFF);
			lightbulb2.immovable = true;
			lightbulb2on = new FlxSprite(20 * tileSize.x,
							10 * tileSize.y,
							Assets.LIGHTBULB_ON);
			lightbulb2on.immovable = true;			
			lightbulb3 = new FlxSprite(32 * tileSize.x,
							5 * tileSize.y,
							Assets.LIGHTBULB_OFF);
			lightbulb3.immovable = true;
			lightbulb3on = new FlxSprite(32 * tileSize.x,
							5 * tileSize.y,
							Assets.LIGHTBULB_ON);
			lightbulb3on.immovable = true;			
			
			if (Information.COMPLETION_STATUS < 25) {
				circuitGroup0.add(lightbulb1);		
				objectGroup.add(lightbulb2);		
				objectGroup.add(lightbulb3);	
				ring = new Ring(7* tileSize.x-6,
								17 * tileSize.y-7.5);
				ring.immovable = true;
				effectGroup.add(ring);				

			} else if (Information.COMPLETION_STATUS < 50) {
				objectGroup.add(lightbulb1on);		
				circuitGroup1.add(lightbulb2);		
				objectGroup.add(lightbulb3);
				ring = new Ring(20 * tileSize.x-6,
								10 * tileSize.y-7.5);
				ring.immovable = true;
				effectGroup.add(ring);				
	
			} else if (Information.COMPLETION_STATUS < 75) {
				objectGroup.add(lightbulb1on);		
				objectGroup.add(lightbulb2on);		
				circuitGroup2.add(lightbulb3);
				ring = new Ring(32 * tileSize.x-6,
								5 * tileSize.y-7.5);
				ring.immovable = true;
				effectGroup.add(ring);				

			} else if (Information.COMPLETION_STATUS < 100) {
				objectGroup.add(lightbulb1on);		
				objectGroup.add(lightbulb2on);		
				objectGroup.add(lightbulb3on);	
				ring = new Ring(32 * tileSize.x-6,
								18 * tileSize.y-7.5);
				ring.immovable = true;
				effectGroup.add(ring);				
				
			} else {
				objectGroup.add(lightbulb1on);		
				objectGroup.add(lightbulb2on);		
				objectGroup.add(lightbulb3on);		
			
				
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
			var instructions:FlxText = new FlxText(0, 0, 800, "Level 2 Progress:");
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
				Information.CURRENT_PROBLEM = new PracticeClass2();
				FlxG.switchState(new CircuitInteractionState);
			}
			if (FlxG.overlap(player, circuitGroup1)) {
				Information.CURRENT_PROBLEM = new PracticeClass2(1);
				FlxG.switchState(new CircuitInteractionState);
			}
			if (FlxG.overlap(player, circuitGroup1)) {
				Information.CURRENT_PROBLEM = new PracticeClass3();
				FlxG.switchState(new CircuitInteractionState);
			}			
			if (FlxG.overlap(player, teleportGroup)) {
				Information.LEVEL = 3;
				Information.COMPLETION_STATUS = 0;
				Information.X_LOCATION = 180;
				Information.Y_LOCATION = 90;
				FlxG.switchState(new OverworldState);
			}
			repairBar.percent = Information.COMPLETION_STATUS;
		}		
    }
}