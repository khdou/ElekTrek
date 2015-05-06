package
{
	public class Coordinate
	{
		public var X:Number;
		public var Y:Number;
		
		public function Coordinate(x:Number, y:Number)
		{
			X = x;
			Y = y;
		}
		
		public function equals(other:Coordinate) 
		{
			if (other.X == X && other.Y == Y) {
				return true;
			}
			return false;
		}
	}
}