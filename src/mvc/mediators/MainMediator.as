package mvc.mediators
{
	import flash.events.Event;
	import mvc.events.ShellEvent;
	import mvc.models.QuizModel;
	import mx.events.FlexNativeMenuEvent;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import mvc.views.AppMenu;
	/**
	 * ...
	 * @author liss
	 */
	public class MainMediator extends Mediator
	{
		[Inject]
		public var view:Main;
		
		[Inject]
		public var _model:QuizModel;
		
		public function MainMediator() 
		{
			super();
		}
		
		override public function initialize():void 
		{
			eventMap.mapListener(view.menu, FlexNativeMenuEvent.ITEM_CLICK, _onItemClick);
			eventMap.mapListener(view, Event.CLOSING, _onManualClose);
		}
		
		private function _onItemClick(e:FlexNativeMenuEvent):void
		{
			switch(e.item.@command.toString()) 
			{	
				case AppMenu.NEW:
					dispatch(new ShellEvent(ShellEvent.NEW_FILE)); 
					break;
								
				case AppMenu.OPEN: 		
					dispatch(new ShellEvent(ShellEvent.OPEN_FILE));
					break;
								
				case AppMenu.SAVE: 
					
					var type:String = _model.url ? ShellEvent.SAVE_FILE : ShellEvent.SAVE_FILE_AS;
					
					dispatch(new ShellEvent(type));
					break;
								
				case AppMenu.SAVE_AS:
					dispatch(new ShellEvent(ShellEvent.SAVE_FILE_AS));
					break;
					
				case AppMenu.EXIT:
					dispatch(new ShellEvent(ShellEvent.EXIT));
					break;
			}					
		}
		
		private function _onManualClose(e:Event):void
		{
			e.preventDefault();
			dispatch(new ShellEvent(ShellEvent.EXIT));
		}
	}

}