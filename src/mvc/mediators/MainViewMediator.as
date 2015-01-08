package mvc.mediators
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mvc.models.QuizModel;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import mvc.events.ShellEvent;
	/**
	 * ...
	 * @author liss
	 */
	public class MainViewMediator extends Mediator
	{
		[Inject]
		public var view:Main;
		
		[Inject]
		public var _model:QuizModel;
		
		public function MainViewMediator() 
		{
			super();
		}
		
		override public function initialize():void 
		{
			eventMap.mapListener(view.SaveBtn,MouseEvent.CLICK, _onSaveClick);
			eventMap.mapListener(view, ShellEvent.OPEN_FILE, _onOpenFile);
			
		}
		
		private function _onOpenFile(e:Event):void
		{
			dispatch(e);
		}
		
		private function _onSaveClick(e:MouseEvent):void
		{
			if (_model.url)
			{
				dispatch(new ShellEvent(ShellEvent.SAVE_FILE));
			}
			else
			{
				dispatch(new ShellEvent(ShellEvent.SAVE_FILE_AS));
			}
		}
	}

}