/*
* A drag and drop class for flixel. All you have to do is implement
* DraggableFlxSprite instead of FlxSprite and voila, it's draggable.
* 
* Drag&drop done easy for flixel 2
* */
package  
{
	import flash.events.MouseEvent;
	
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.*;
	
	public class DraggableFlxSprite extends FlxSprite
	{
		public var dragging:Boolean;
		public var draggable:Boolean;
		public var startX:Number;
		public var startY:Number;
		public var info:FlxText;
		
		
		public function DraggableFlxSprite(X:Number=0,Y:Number=0,SimpleGraphic:Class=null,drag:Boolean=true, i:FlxText=null) 
		{
			draggable = drag;
			startX = X;
			startY = Y;
			super(X, Y, SimpleGraphic);
			FlxG.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);			
			FlxG.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			info = i;
			
	
		}
		
		public override function update():void
		{
			if (this.dragging) {
				this.x = FlxG.mouse.screenX - this.width / 2;
				this.y = FlxG.mouse.screenY - this.height / 2;
			}
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
		
		protected function onMouseDown(event:MouseEvent):void
		{
			// I don't know if this check is important - copied it from FlxButton
			if (!exists || !visible || !active || !draggable) {
				return;
			}
			if (overlapsPoint(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y))) {
				this.dragging = true;
				var xx:Number = int(this.x / 100);
				var yy:Number = int(this.y / 100);
				CircuitInteractionState.items[xx][yy] = null;
			}
			
		}
		
		protected function onMouseUp(event:MouseEvent):void
		{
			// I don't know if this check is important - copied it from FlxButton
			if (!exists || !visible || !active || !FlxG.mouse.justReleased() || !draggable) {
				return;
			}
			
			if (dragging) {
				
				if (this.x < 450 && this.y < 450) {
					this.x = int((this.x)/ 100) * 100 + 18;
					this.y = int((this.y)/ 100) * 100 + 79;
					var xx:Number = int((this.x - 18) / 100);
					var yy:Number = int((this.y - 79) / 100);
					CircuitInteractionState.items[xx][yy] = this
				}
				else {
					this.x = startX;
					this.y = startY;
				}
				
			}
			else {
				if (overlapsPoint(new FlxPoint(FlxG.mouse.x, FlxG.mouse.y))) {
					this.x = startX;
					this.y = startY;
				}
			}
			this.dragging = false;
			// sets coordinates of pixel
		
		}
	}
}