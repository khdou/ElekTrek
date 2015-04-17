package 
{
	/**
	 * This class represent the equation/knowledge model we want student to
	 * understand as well as method for assessing their understanding
	 * 
	 * Practice Class 1 : V = IR
	 * 
	 * @author Tomit Huynh
	 */
	public class PracticeClass1 
	{
		private var V:Number;
		private var I:Number;
		private var R:Number;
		public var missing
		public var circuitConfig // there could be many map configuration to display for this knowledge model
		
		public function PracticeClass1() 
		{
			//Need to figure out how map will communicate with the equation
		}
		
		public function setCircuitConfig(circuitConfig): void
		{
			
		}
		
		/**
		 * Each PracticeClass have a unique knowledge model, and therefore would have a few constraint 
		 * a circuit config must follow. Each config would require a unique parsing function...
		 */
		private function parseCircuitConfig(): void
		{
			
		}
		
		public function setV(volts:Number): void 
		{
			V = volts;
		}
		
		public function setI(amps:Number): void 
		{
			I = amps;
		}
		
		public function setR(ohms:Number): void 
		{
			R = ohms
		}
	}

}