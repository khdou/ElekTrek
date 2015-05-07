package 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author ...
	 */
	public class CutsceneState extends FlxState 
	{
		
		protected var cutscene:AbstractAnimatable;
		
		public function CutsceneState() 
		{
			cutscene = new Scene1(0, 0);
			add(cutscene);		
			var instructions:FlxText = new FlxText(0, 0, 800, "Level 1 Progress: " + Information.X_LOCATION + " " + Information.Y_LOCATION);
			instructions.alignment = "center";
			instructions.size = 20;
			add(instructions);			
		}

	}

}