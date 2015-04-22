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

			super(X, Y, CircuitAssets[n], drag);
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