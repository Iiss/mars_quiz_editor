package mvc.commands 
{
	import mvc.models.QuizModel;
	import robotlegs.bender.bundles.mvcs.Command;
	
	/**
	 * ...
	 * @author liss
	 */
	public class CreateCommand extends Command 
	{
		[Inject]
		public var _model:QuizModel;
		
		public function CreateCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			_model.reset();
		}
		
	}

}