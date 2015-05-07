package 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Scene2 extends AbstractAnimatable 
	{
		
		public function Scene2(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(
				Assets.SCENE2, // image to use
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
			addAnimation("cutscene", [0, 1, 2, 3], 1, false);
			addAnimationCallback(switchStates)
		}
		
		private function switchStates(animationName:String, currentFrame:uint, currentFrameIndex:uint):void
		{
			if (currentFrame >= 3) {
				Information.X_LOCATION = 390;
				Information.Y_LOCATION = 210;
				Information.CURRENT_SCENE = new Scene3(0, 0);				
				FlxG.switchState(new CutsceneState());
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