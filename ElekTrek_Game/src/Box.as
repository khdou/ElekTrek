package 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Box extends AbstractAnimatable 
	{
		
		public function Box(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(Assets.BOX, true, false, 32, 30);
			play("loop");
		}
		
		protected override function createAnimations():void {
			addAnimation("loop", [0, 1, 2, 3], 2, true);
		}
	}

}