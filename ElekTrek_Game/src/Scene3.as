package 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Scene3 extends AbstractAnimatable 
	{
		
		public function Scene3 (X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(
				Assets.SCENE3, // image to use
				true, // animated
				false, // don't generate "flipped" images since they're already in the image
				800, // width of each frame (in pixels)
				600 // height of each frame (in pixels)
			);			
			createAnimations();
			play("cutscene");
		}
		
		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		protected override function createAnimations():void {
			addAnimation("cutscene", [0, 1, 2, 3, 4, 5, 6], 1, false);
			addAnimationCallback(switchStates)
		}
		
		private function switchStates(animationName:String, currentFrame:uint, currentFrameIndex:uint):void
		{
			if (currentFrame >= 6) {
				Information.X_LOCATION = 390;
				Information.Y_LOCATION = 210;
				FlxG.switchState(new OverworldState());
			}
		}
		
		/**
         * Update each timestep
         */
        public override function update():void {
            super.update();
        }		

	}

}