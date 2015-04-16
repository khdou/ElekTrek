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
			
			items = new Array(1);
			
			var i:Number;
			var j:Number;
			for (i = 0; i < 5; i++) {
				for (j = 0; j < 5; j++) {
					var component:FlxSprite = new FlxSprite(i * 100, j * 100, CircuitAssets.BlueTile);
					add(component);
				}
			}
			
			var compo:Item = new Item("YellowTile", 0, 100, 0);
			add(compo);
			var compo:Item = new Item("YellowTile", 0, 200, 0);
			add(compo);
			var compo:Item = new Item("YellowTile", 0, 300, 0);
			add(compo);
			var compo:Item = new Item("YellowTile", 100, 100, 0);
			add(compo);
			var compo:Item = new Item("YellowTile", 100, 300, 0);
			add(compo);
			var compo:Item = new Item("YellowTile", 200, 300, 0);
			add(compo);
			//var compo:Item = new Item("wire", 200, 100, CircuitAssets.RedTile);
			//add(compo);
			var compo:Item = new Item("YellowTile", 300, 100, 0);
			add(compo);
			var compo:Item = new Item("YellowTile", 300, 200, 0);
			add(compo);
			var compo:Item = new Item("YellowTile", 300, 300, 0);
			add(compo);
			
			for (i = 0; i < 5; i++) {		
				var compo:Item = new Item("RedTile", 600, i * 100, 0);
				add(compo);
			}
			
			run = new FlxButton(100, FlxG.height -60, "Run Circuit", runCircuit);
			run.scale.x = 3;
			run.scale.y = 3;
			add(run);
			
			super.create();
			
		}
		
		public function runCircuit():void 
		{
			var output:String = "";
			var i:Number;
			var j:Number;
			for (i = 0; i < 5; i++) {
				for (j = 0; j < 5; j++) {
					if (items[i][j] != null) {
						output += (i * j);
					}
				}
			}
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