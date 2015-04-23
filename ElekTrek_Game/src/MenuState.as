package 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Kevin Dou
	 */
	public class MenuState extends FlxState 
	{
		
		public function MenuState() 
		{
			super();
			FlxG.bgColor = 0xff756f00;
			
		}
		
		override public function update():void
		{
			if(FlxG.keys.justReleased("ENTER"))
				FlxG.switchState(new OverworldState());
		}		
		
	}

}