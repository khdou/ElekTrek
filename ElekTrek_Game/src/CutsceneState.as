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
			cutscene = Information.CURRENT_SCENE;
			add(cutscene);			
		}

	}

}