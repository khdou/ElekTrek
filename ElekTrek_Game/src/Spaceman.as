package 
{
    import org.flixel.*;
	/**
	 * ...
	 * @author Kevin 
	 */
	public class Spaceman extends AbstractCharacter 
	{
		
		public function Spaceman(X:Number, Y:Number) 
		{
			super(X, Y);
			loadGraphic(
				Assets.OVERWORLD_SPACEMAN, // image to use
				true, // animated
				false, // don't generate "flipped" images since they're already in the image
				AbstractCharacter.SIZE.x, // width of each frame (in pixels)
				AbstractCharacter.SIZE.y // height of each frame (in pixels)
			);			
		}
		
		/**
		 * Check for user input to control this entity
		 */
		override protected function updateControls():void {
			super.updateControls();
			// check keys
			// NOTE: this accounts for someone pressing multiple arrow keys at the same time (even in opposite directions)
			var movement:FlxPoint = new FlxPoint();
			if (FlxG.keys.pressed("LEFT"))
				movement.x -= 1;
			if (FlxG.keys.pressed("RIGHT"))
				movement.x += 1;
			if (FlxG.keys.pressed("UP"))
				movement.y -= 1;
			if (FlxG.keys.pressed("DOWN"))
				movement.y += 1;
			// check final movement direction
			if (movement.x < 0) {
				moveLeft();
			} else if (movement.x > 0) {
				moveRight();
			}
			if (movement.y < 0)
				moveUp();
			else if (movement.y > 0)
				moveDown();
		}		
	}

}