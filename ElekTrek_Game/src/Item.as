package
{
	import org.flixel.*;
	
	public class Item extends DraggableFlxSprite
	{
		public var isVisible:Boolean;
		public var value:Number; 
		public var name:String; 
		public var description:String;
		public var info:FlxText;
			
		public function Item(n:String, X:Number,Y:Number,v:Number,drag:Boolean=true) 
		{

			//if (n.indexOf("Wire") != 0)
			info = new FlxText(200,200,100, "erere");
			super(X, Y, CircuitAssets[n], drag);
			name = n;
			isVisible = true;
			value = v;
			description = "hello";
				
		}
		
		public override function update():void {
			info.text = value.toString();
			if (info != null) {
				if (overlapsPoint(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y))) {
					info.x = this.x + 35;
					info.y = this.y + 35;
					info.size = 30;
					info.visible = true;
				}
				else {
					info.visible = false;
				}
			}
			super.update();
		}
	
	}
}