package mvc.mediators
{
	import flash.events.Event;
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
		
		public function MainViewMediator() 
		{
			super();
		}
		
		override public function initialize():void 
		{
			view.addEventListener(ShellEvent.OPEN_FILE, _onOpenFile);
		}
		
		private function _onOpenFile(e:Event):void
		{
			dispatch(e);
		}
	}

}