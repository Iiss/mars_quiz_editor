package  
{
	import mvc.models.QuizModel;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.modularity.api.IModuleConnector;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IInjector;
	import mvc.mediators.MainViewMediator;
	import mvc.commands.OpenCommand;
	import mvc.commands.SaveCommand;
	import mvc.commands.SaveAsCommand;
	import mvc.events.ShellEvent;
	import Main
	/**
	 * ...
	 * @author liss
	 */
	public class MainViewConfig implements IConfig
	{
		[Inject]
		public var injector:IInjector;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var eventCommandMap:IEventCommandMap;

		[Inject]
		public var contextView:ContextView;
		
		
		public function MainViewConfig() 
		{
			
		}
		
		public function configure():void
		{
			//MODELS
			injector.map(QuizModel).toValue(new QuizModel);
			
			//MEDIATORS
			mediatorMap.map(Main).toMediator(MainViewMediator);
			
			//Events
			eventCommandMap.map(ShellEvent.OPEN_FILE, ShellEvent).toCommand(OpenCommand);
			eventCommandMap.map(ShellEvent.SAVE_FILE, ShellEvent).toCommand(SaveCommand);
			eventCommandMap.map(ShellEvent.SAVE_FILE_AS, ShellEvent).toCommand(SaveAsCommand);
		}
		
	}

}