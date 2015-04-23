package
{
	import flash.display.Sprite;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	import org.flixel.*;
	
	public class CircuitInteractionState extends FlxState
	{
		public var myLoader:URLLoader;
		public static var items:Array;
		public static var itemRemove;
		private var run:FlxButton;
		private var prev:FlxButton;
		private var next:FlxButton;
		private var ret:FlxButton;
		public var page:int;
		public static var currItems:Array;
		public var pp:PracticeClass1;
		
		// Practice Type 1
		public var practice1:PracticeClass1 = new PracticeClass1();
		
		//[Embed(source="background.")] private var bckgrndClass:Class;
		
		override public function create():void
		{
			//myLoader = new URLLoader(new URLRequest("items.csv"));
			//myLoader.addEventListener(Event.COMPLETE, loadComplete);
			
			pp = new PracticeClass1();
			
			page = 0;
			
			FlxG.bgColor = 0xffaaaaaa;
			FlxG.mouse.show();
			
			
			items = new Array(5);
			itemRemove = null;
			items[0] = [null, null, null, null, null];
			items[1] = [null, null, null, null, null];
			items[2] = [null, null, null, null, null];
			items[3] = [null, null, null, null, null];
			items[4] = [null, null, null, null, null];
			
			
			add(new FlxSprite(0, 0, CircuitAssets.Screen));
			add(new FlxSprite(530, 17, CircuitAssets.LightBulbOff));
			
			for each (var comp in pp.getCircuitConfig())
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
			next = new FlxButton(700, FlxG.height - 60, "Next", nextPage);
			next.scale.x = .7;
			next.scale.y = 2;
			prev = new FlxButton(530, FlxG.height - 60, "Prev", prevPage);
			prev.scale.x = .7;
			prev.scale.y = 2;
			add(next);
			add(prev);
			super.create();
			
		}
		
		public static function getItem(x:int, y:int):Item {
			return items[x][y];
		}
		
		public function runCircuit():void 
		{
			var output:Boolean = pp.isCorrect();
			//add(new FlxText(500, 500, 100, output));
			if (output) {
				add(new FlxSprite(530, 17, CircuitAssets.LightBulbOn));
				var timer:Timer = new Timer(1000);
				timer.addEventListener(TimerEvent.TIMER, ret_func); // will call callback()
				timer.start();
			}
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
		
		public function removeItem(i:Item):void {
			remove(i);
		}
		
		public function removeItems():void {
			for each (var comp in currItems)
			{
				if (comp.x > 418 || comp.y > 500)
					remove(comp);
			}
		}
		
		public function ret_func():void {
			FlxG.switchState(new Overworld());
		}
		
		override public function update():void
		{
			if (itemRemove != null) {				
				remove(itemRemove);
				itemRemove = null;
			}
			super.update();
		}
		
	}
}