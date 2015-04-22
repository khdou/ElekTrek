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
		private var prev:FlxButton;
		private var next:FlxButton;
		private var ret:FlxButton;
		public var page:int;
		public static var currItems:Array;
		
		//[Embed(source="background.")] private var bckgrndClass:Class;
		
		override public function create():void
		{
			//myLoader = new URLLoader(new URLRequest("items.csv"));
			//myLoader.addEventListener(Event.COMPLETE, loadComplete);
			
			page = 0;
			
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
			currItems = Inventory.getItems(0)
			addItems();
			
			
			run = new FlxButton(450, 30, "Run", runCircuit);
			run.scale.x = .7;
			run.scale.y = 2.5;
			add(run);
			ret = new FlxButton(6, 30, "Back", ret_func);
			ret.scale.x = .7;
			ret.scale.y = 2.5;
			add(ret);
			
			//add buttons for next and prev
			//next = new FlxButton(100, FlxG.height - 60, "Next", nextPage);
			//prev = new FlxButton(100, FlxG.height - 60, "Prev", prevPage);
			//add(next);
			//add(prev);
			super.create();
			
		}
		
		public static function getItem(x:int, y:int):Item {
			return items[x][y];
		}
		
		public function runCircuit():void 
		{
			var pp:PracticeClass1 = new PracticeClass1();
			var output:String = pp.isCorrect();
			add(new FlxText(500, 500, 100, output));
		}
		
		public function prevPage():void {
			if (page == 0)
				return;
			page = page - 1;
			removeItems();
			currItems = Inventory.getItems(page);
			addItems();
			
		}
		
		public function nextPage():void {
			if (Inventory.getItems(page + 1) == null)
				return;
			page = page + 1;
			removeItems();
			currItems = Inventory.getItems(page);
			addItems();
		}
		
		public function addItems():void {
			for each (var comp in currItems)
			{
				add(comp);
			}
		}
		
		public function removeItems():void {
			for each (var comp in currItems)
			{
				comp.kill();
			}
		}
		
		public function ret_func():void {
			FlxG.switchState(new Overworld());
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}
}