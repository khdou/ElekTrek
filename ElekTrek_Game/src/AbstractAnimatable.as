package 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author ...
	 */
	public class AbstractAnimatable extends FlxSprite 
	{
		
		public function AbstractAnimatable(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			createAnimations();
		}
		
		/**
		 * Create the animations for this entity
		 * NOTE: these will be different if your art is different
		 */
		protected function createAnimations():void {
		}		
		
        /**
         * Update each timestep
         */
        public override function update():void {
            super.update();
			Information.X_LOCATION = this.x;
			Information.Y_LOCATION = this.y;
        }
	}

}