package
{
	import org.flixel.*;
	
	public class Item extends DraggableFlxSprite
	{
		var isVisible:Boolean;
		var value:Number; 
		var name:String; 
		var description:String;
			
		public function Item(n:String, X:Number,Y:Number,v:Number) 
		{
			super(X, Y, CircuitAssets[n]);
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