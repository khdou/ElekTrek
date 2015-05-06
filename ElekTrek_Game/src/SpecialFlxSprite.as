package 
{
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	/**
	 * This class is needed to save specific information about these Sprite.
	 * 
	 * @author Tomit Huynh
	 */
	public class SpecialFlxSprite extends FlxExtendedSprite
	{
		public var inventoryID:int;
		public var itemName:String;
		
		public function SpecialFlxSprite(X:Number=0,Y:Number=0,SimpleGraphic:Class=null ) 
		{
			super(X, Y, SimpleGraphic);
			inventoryID = null;
			itemName = null;
		}
		
	}

}