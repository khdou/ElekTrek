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
				//var inf:FlxText = new FlxText(200,200,100, "erere");
				//comp.info = inf;
				add(comp);
				add(comp.info);
			}
			
			var temp:Array = Inventory.getItems(0);
			addItems(temp);
			
			
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
				//var timer:Timer = new Timer(1000);
				//timer.addEventListener(TimerEvent.TIMER, ret_func); // will call callback()
				//timer.start();
			}
		}
		
		public function prevPage():void {
			if (page == 0)
				return;
			page = page - 1;
			removeItems();
			var temp:Array = Inventory.getItems(page);
			addItems(temp);
			
		}
		
		public function nextPage():void {
			if (Inventory.getItems(page + 1) == null)
				return;
			page = page + 1;
			removeItems();
			var temp:Array = Inventory.getItems(page);
			addItems(temp);
		}
		
		public function addItems(temp:Array):void {
			currItems = new Array();
			for (var i:int = 0; i < temp.length; i++) {
				var item:Item = new Item("ResistorHorizontal", 6, i, temp[i]);
				currItems.push(item);
				add(item);
				add(item.info);
			}
			
		}
		
		public function removeItem(i:Item):void {
			remove(i);
			remove(i.info);
		}
		
		public function removeItems():void {
			for each (var comp in currItems)
			{
				if (comp.x > 418 || comp.y > 500)
					remove(comp);
					remove(comp.info);
			}
		}
		
		public function ret_func():void {
			FlxG.switchState(new OverworldState());
		}
		
		override public function update():void
		{
			if (itemRemove != null) {				
				remove(itemRemove);
				remove(itemRemove.info);
				itemRemove = null;
			}
			super.update();
		}
		
	}
}