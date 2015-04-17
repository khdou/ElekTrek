package
{
	import org.flixel.*;
	
	public class Item extends DraggableFlxSprite
	{
		public var isVisible:Boolean;
		public var value:Number; 
		public var name:String; 
		public var description:String;
			
		public function Item(n:String, X:Number,Y:Number,v:Number,drag:Boolean=true) 
		{
			var i:FlxText = null;
			if (v != 0)
				i = new FlxText(0, 0, 100, v.toString());
			super(X, Y, CircuitAssets[n], drag, i);
			name = n;
			isVisible = true;
			value = v;
			description = "hello";
				
		}
		
		public override function update():void {
			super.update();
		}
	
	}
}