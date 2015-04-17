package
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	
	import org.flixel.*;
	
	public class CircuitInteractionState extends FlxState
	{
		public var myLoader:URLLoader;
		public static var items:Array;
		private var run:FlxButton;
		//[Embed(source="background.")] private var bckgrndClass:Class;
		
		override public function create():void
		{
			//myLoader = new URLLoader(new URLRequest("items.csv"));
			//myLoader.addEventListener(Event.COMPLETE, loadComplete);
			
			
			FlxG.bgColor = 0xffaaaaaa;
			FlxG.mouse.show();
			
			items = new Array(5);
			items[0] = [null, null, null, null, null];
			items[1] = [null, null, null, null, null];
			items[2] = [null, null, null, null, null];
			items[3] = [null, null, null, null, null];
			items[4] = [null, null, null, null, null];
			
			
			add(new FlxSprite(0, 0, CircuitAssets.Screen));
			
			for each (var comp in PracticeClass1.config1)
			{
				//var indicator = comp.name.charAt(0);
				//// Battery
				//if (indicator == "B") {
					//comp.value = V;
				//}else if (indicator == "R" || indicator == "L") {
					//comp.value = R;
				//}else {
					//comp.value = I;
				//}
				//var i:FlxText = null;
//
					//i = new FlxText(0, 0, 100, v.toString());
				//comp.add(i)
				add(comp);
			}
					
			//add(new Item("RedTile", 543, 183, 9));
			//add(new Item("RedTile", 663, 183, 8));
			//add(new Item("RedTile", 543, 300, 7));
			//add(new Item("RedTile", 663, 300, 6));
			//add(new Item("RedTile", 543, 415, 5));
			//add(new Item("RedTile", 663, 415, 4));
			
			for each (var comp in Inventory.getItems(0))
			{
				add(comp);
			}
			
			
			run = new FlxButton(100, FlxG.height -60, "Run Circuit", runCircuit);
			run.scale.x = 3;
			run.scale.y = 3;
			add(run);
			
			super.create();
			
		}
		
		public function getItem(x:int, y:int) {
			return items[x][y];
		}
		
		public function runCircuit():void 
		{
			var output:String = PracticeClass1.isCorrect();
			//var i:Number;
			//var j:Number;
			//for (i = 0; i < 5; i++) {
				//for (j = 0; j < 5; j++) {
					//if (items[i][j] != null) {
						//output += (i * j);
					//}
				//}
			//}
			add(new FlxText(500, 500, 100, output));
		}
		
		override public function update():void
		{
			super.update();
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
			
			
			
			var i:Number;
			var j:Number;
			for (i = 0; i < 5; i++) {
				for (j = 0; j < 5; j++) {
					temp = entries[5 * i + j].split(",");
					var component:Item = new Item(temp[0], i * 100, j * 100);
					component.loadGraphic(ImgTile);
					items.push(component);
					add(component);
				}
			}		
		}
		*/
	}
}