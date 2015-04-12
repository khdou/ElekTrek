package
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import org.flixel.*;
	
	[SWF(width="800", height="600", backgroundColor="#000000")]
	public class EZPlatformer extends FlxGame
	{
		static var items:Array;
		var myLoader:URLLoader;
		
		FlxG.debug = true;
		FlxG.log("sdsd");
		
		public function EZPlatformer()
		{
			//super(320,240,PlayState,2);
			//myLoader = new URLLoader(new URLRequest("items.txt"));
			//myLoader.addEventListener(Event.COMPLETE, loadComplete);		
			items = new Array(5);
			items[0] = [null, null, null, null, null];
			items[1] = [null, null, null, null, null];
			items[2] = [null, null, null, null, null];
			items[3] = [null, null, null, null, null];
			items[4] = [null, null, null, null, null];
			
			
			super(800,600,BaseLevelState);
		}
		
		/*
		public function loadComplete(e:Event):void
		{
			items = new Array();
			var entries:Array = myLoader.data.split("\n\r");
			
			var temp:Array;
			for(var entry:String in entries){
				temp = entries[entry].split(",");
				var item:Item = new Item(temp[0]);
				item.visible = false;
				//path to image
				item.loadGraphic(temp[1]);
				items.push(item);
			}
		}
		*/
	}
}