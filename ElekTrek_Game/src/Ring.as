package 
{
	
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ring extends AbstractAnimatable 
	{
		
		public function Ring(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(
				Assets.RING, // image to use
				true, // animated
				false, // don't generate "flipped" images since they're already in the image
				45, // width of each frame (in pixels)
				45 // height of each frame (in pixels)
			);			
			createAnimations();			
			play("glow");
		}
		
		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		protected override function createAnimations():void {
			addAnimation("glow", [0,1,2,3], 6, true);
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