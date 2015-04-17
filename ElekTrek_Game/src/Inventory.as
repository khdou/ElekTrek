package
{
	import org.flixel.*;
	
	public class Inventory extends DraggableFlxSprite
	{
		public static var items:Array = [
			new Item("RedTile", 543, 183, 9),
			new Item("RedTile", 663, 183, 8),
			new Item("RedTile", 543, 300, 7),
			new Item("RedTile", 663, 300, 6),
			new Item("RedTile", 543, 415, 5),
			new Item("RedTile", 663, 415, 4),
			new Item("RedTile", 543, 183, 9),
			new Item("RedTile", 663, 183, 8),
			new Item("RedTile", 543, 300, 7)
		];
		
		public static function addItem(item:Item):void {
			items.concat(item);
		}
		
		public static function removeItem(name:String):void {
			for (var i:int = 0; i < items.length(); i++) {
				if (items[i].name == name) {
					delete items[i];
					break;
				}
			}
		}
		
		public static function getItems(page:Number):Array {
			//if (page * 6 > items.length() )
			//	return null;
			//if ((page + 1) * 6 > items.length() )
				return items.slice(6*page);
			//return items.slice(6 * page, 6 * (page + 1));
		}
		
	}
}