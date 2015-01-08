package mvc.commands 
{
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import mvc.models.QuizModel;
	import flash.filesystem.FileMode;
	/**
	 * ...
	 * @author liss
	 */
	public class SaveCommand extends AsyncCommand 
	{
		[Inject]
		public var _model:QuizModel;
		
		public function SaveCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			var file:File = new File(_model.url);
			write(file);
		}
		
		protected function write(file:File):void
		{
			var stream:FileStream = new FileStream();
			
			stream.open(file, FileMode.WRITE);
			stream.writeUTFBytes(_model.serialize().toXMLString());
			stream.close();
			dispatchComplete(true);
		}
		
	}

}