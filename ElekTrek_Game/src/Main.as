package
{
	import org.flixel.*;
	
	/**
	 * 
	 * @author Kevin
	 */
	
	// tell Flash to use a 480x480 window with a white background.
    [SWF(width = "800", height = "600", backgroundColor = "#ffffff")]	
	// tell Flash to use our Preloader class while loading.
    [Frame(factoryClass="Preloader")]
	
	public class Main extends FlxGame 
	{
		
		public function Main() 
		{

			//super(800,600,OverworldState);
			super(800,600,OverworldState);
		}
		
	}
	
}