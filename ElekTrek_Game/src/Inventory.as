package
{
	import org.flixel.*;
	
	public class Inventory extends DraggableFlxSprite
	{
		public static var items:Array = [
			new Item("ResistorHorizontal", 543, 183, 9),
			new Item("ResistorHorizontal", 663, 183, 8),
			new Item("ResistorHorizontal", 543, 300, 7),
			new Item("ResistorHorizontal", 663, 300, 6),
			new Item("ResistorHorizontal", 543, 415, 5),
			new Item("ResistorHorizontal", 663, 415, 4),
			new Item("ResistorHorizontal", 543, 183, 9),
			new Item("ResistorHorizontal", 663, 183, 8),
			new Item("ResistorHorizontal", 543, 300, 7)
		];
		
		public static var column:Array = [543, 663]
		public static var row:Array = [183, 300, 415]
		
		public static function addItem(item:Item):void {
			items.concat(item);
		}
		
		public static function update():void {
			for (var i:int = 0; i < items.length(); i++) {
				items[i].x = column[(i % 6) % 2];
				items[i].y = row[(i % 6) / 2];
			}
		}
		
		public static function removeItem(name:String):void {
			for (var i:int = 0; i < items.length(); i++) {
				if (items[i].name == name) {
					delete items[i];
					break;
				}
			}
			update();
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