package mvc.commands 
{
	import flash.events.Event;
	import flash.filesystem.File;
	/**
	 * ...
	 * @author liss
	 */
	public class SaveAsCommand extends SaveCommand 
	{
		private var _file:File = new File();
		
		public function SaveAsCommand() 
		{
			
		}
		
		override public function execute():void 
		{
			_file.browseForSave("Save");
			
			addListeners();
		}
		
		private function addListeners():void
		{
			_file.addEventListener(Event.CANCEL, _onCancel);
			_file.addEventListener(Event.SELECT, _onSelect);
		}
		
		private function removeListeners():void
		{
			_file.removeEventListener(Event.CANCEL, _onCancel);
			_file.removeEventListener(Event.SELECT, _onSelect);
		}
		
		private function _onCancel(e:Event):void
		{
			removeListeners();
			dispatchComplete(true);
		}
		
		private function _onSelect(e:Event):void
		{
			removeListeners();
			write(_file);
			dispatchComplete(true);
		}
	}

}