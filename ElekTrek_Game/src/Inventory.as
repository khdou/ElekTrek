package
{
	import org.flixel.*;
	
	public class Inventory extends DraggableFlxSprite
	{
		public static var items:Array = [9,8,7,6,5,4];
		
		public static var column:Array = [543, 663]
		public static var row:Array = [183, 300, 415]
		
		public static function addItem():void {
			items.concat(Math.ceil(Math.random()*20));
		}
		
		public static function getX(i:int):int {
			if (i % 2 == 0)
				return column[0];
			else 
				return column[1];
		}
		
		public static function getY(i:int):int {
			return row[int(i / 2)];
		}
		
		public static function getItems(page:Number):Array {
			if ((page * 6) > items.length )
				return null;
			if ((page + 1) * 6 > items.length )
				return items.slice(6*page);
			return items.slice(6 * page, 6 * (page + 1));
		}
		
	}
}