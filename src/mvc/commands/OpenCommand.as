package mvc.commands 
{
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	/**
	 * ...
	 * @author liss
	 */
	public class OpenCommand extends AsyncCommand
	{
		
		public function OpenCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			trace('openFile >>');
		}
		
	}

}