package mvc.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author liss
	 */
	public class ShellEvent extends Event 
	{
		public static var NEW_FILE:String = "ShellEvent.NEW_FILE";
		public static var OPEN_FILE:String = "ShellEvent.OPEN_FILE";
		public static var SAVE_FILE:String = "ShellEvent.SAVE_FILE";
		
		public function ShellEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{ 
			super(type, bubbles, cancelable);
			
		} 
		
		public override function clone():Event 
		{ 
			return new ShellEvent(type, bubbles, cancelable);
		} 
		
		public override function toString():String 
		{ 
			return formatToString("ShellEvent", "type", "bubbles", "cancelable", "eventPhase"); 
		}
		
	}
	
}