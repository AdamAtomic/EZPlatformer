package
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class EZPlatformer extends FlxGame
	{
		public function EZPlatformer()
		{
			super(320,240,PlayState,2);
			forceDebugger = true;
		}
	}
}
