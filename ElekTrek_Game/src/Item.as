package
{
	import org.flixel.*;
	
	public class Item extends DraggableFlxSprite
	{
		var isVisible:Boolean;
		var value:int; 
		var name:String; 
		var description:String;
			
		public function Item(n:String, X:Number=0,Y:Number=0,SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			name = n;
			isVisible = true;
			value = 1;
			description = "hello";
				
		}
		
		public override function update():void {
			super.update();
		}
	}
}