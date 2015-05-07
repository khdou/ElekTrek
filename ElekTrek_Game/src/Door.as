package 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author 
	 */
	public class Door extends AbstractAnimatable 
	{

		public function Door(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(
				Assets.DOOR, // image to use
				true, // animated
				false, // don't generate "flipped" images since they're already in the image
				120, // width of each frame (in pixels)
				30 // height of each frame (in pixels)
			);			
			createAnimations();
			play("opening");
			
		}

		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		protected override function createAnimations():void {
			addAnimation("idle", [0]);
			addAnimation("opening", [0,1,2,3,4,5,6,7,8,9,10,11,12,13],6,false);
			addAnimation("closing", [13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0], 6, false);
			
		}
		
        /**
         * Update each timestep
         */
        public override function update():void {
            super.update();
        }

		/**
		 * Based on current state, show the correct animation
		 * FFV: use state machine if it gets more complex than this
		 */
		public function animate():void {
			play("opening");
		}				

	}

}