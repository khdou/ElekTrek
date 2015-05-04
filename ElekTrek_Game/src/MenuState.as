package
{
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		override public function create():void
		{
            FlxG.mouse.show();			
			
			var background = new FlxSprite(0, 0, Assets.MENU_BACKGROUND);
			add(background);
			
			var playButton:FlxButton = new FlxButton(FlxG.width / 3, FlxG.height / 3 - 10, "Play", playButtonCallback);
			add(playButton);			
			
		} 
 
		public function playButtonCallback():void
		{
			FlxG.switchState(new OverworldState);
		}
		
		override public function update():void
		{
			super.update(); // calls update on everything you added to the game loop
		} 
 
 
		public function MenuState()
		{
			super();
 
		} 
 
	} 
}
 