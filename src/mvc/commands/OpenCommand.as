package mvc.commands 
{
	import eu.alebianco.robotlegs.utils.impl.AsyncCommand;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.filesystem.FileStream;
	import flash.net.FileFilter;
	import flash.filesystem.FileMode;
	import mvc.models.QuizModel;
	/**
	 * ...
	 * @author liss
	 */
	public class OpenCommand extends AsyncCommand
	{
		private var _quizFilter:FileFilter = new FileFilter("Quiz File", "*.*");
		private var _file:File;
		
		[Inject]
		public var _model:QuizModel;
		
		public function OpenCommand() 
		{
			super();
		}
		
		override public function execute():void 
		{
			_file = new File();
			_addFileListeners();
			
			_file.browseForOpen("Open",[_quizFilter]);
		}
		
		private function _addFileListeners():void
		{
			_file.addEventListener(Event.CANCEL, _onCancel);
			_file.addEventListener(Event.SELECT, _onSelect);
		}
		
		private function _removeFileListeners():void
		{
			_file.removeEventListener(Event.CANCEL, _onCancel);
			_file.removeEventListener(Event.SELECT, _onSelect);
		}
		
		private function _onCancel(e:Event):void
		{
			_removeFileListeners();
			dispatchComplete(true);
		}
		
		private function _onSelect(e:Event):void
		{
			_removeFileListeners();
			
			try
			{
				var stream:FileStream = new FileStream();
				stream.open(_file, FileMode.READ);
				
				var str:String = stream.readMultiByte(_file.size, File.systemCharset);
				trace(str);
				_model.url = _file.url;
				dispatchComplete(true);
			}
			catch (err:Error)
			{
				trace(err);
				dispatchComplete(false);
			}
				
		}
		
	}

}