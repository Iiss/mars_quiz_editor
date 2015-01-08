package mvc.commands 
{
	import mx.core.FlexGlobals;
	import robotlegs.bender.bundles.mvcs.Command;
	import spark.components.WindowedApplication;
	/**
	 * ...
	 * @author liss
	 */
	public class ExitCommand extends Command
	{
		
		public function ExitCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			(FlexGlobals.topLevelApplication as WindowedApplication).exit();
		}
		
	}

}