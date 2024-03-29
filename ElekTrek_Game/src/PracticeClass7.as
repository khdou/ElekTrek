package
{
	//puzzle for 2 resistors in series on same line
	public class PracticeClass7 extends AbstractPracticeProblem
	{
		public function PracticeClass7()
		{
			super();
			generateValues();
			
		}
		
		override protected function generateValues():void 
		{		
			var length:int = Inventory.getSize();
			var index1:int = Math.floor(Math.random() * length);
			var index2:int = Math.floor(Math.random() * length);
			while (index2 == index1)
				index2 = Math.floor(Math.random() * length);
						
			I = Math.floor(Math.random() * 10) + 1;					
			R = Inventory.getItem(index1).value + Inventory.getItem(index2).value;		
			V = I * R;		
			
			
			for (var i:int = 0; i < AbstractPracticeProblem.SIZE; i++) {
				for (var j:int = 0; j < AbstractPracticeProblem.SIZE; j++) {
					
					var component:Item = itemContainer[i][j];
					if (component != null) {
						var indicator:String = itemContainer[i][j].name.charAt(0);
						// Battery
						if (indicator == "B") {
							itemContainer[i][j].value = V;
						}else if (indicator == "R" || indicator == "L") {
							itemContainer[i][j].value = R;
						}else {
							itemContainer[i][j].value = I;
						}
					}
				}
			}
			
		}
		
		override public function isCorrect(): Boolean 
		{
			var missingComp1:Item = itemContainer[missingCoord[0].X][missingCoord[0].Y]
			var missingComp2:Item = itemContainer[missingCoord[1].X][missingCoord[1].Y]
			if (missingComp1 == null || missingComp2 == null) return false;
			
			return (missingComp1.value + missingComp2.value) == R ? true : false;
		}
	}
}