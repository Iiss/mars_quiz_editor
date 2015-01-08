package mvc.models 
{
	/**
	 * ...
	 * @author liss
	 */
	public class QuizModel 
	{
		private var _chapters:Vector.<QuizChapter>;
		public var url:String;
		
		public function QuizModel() 
		{
			_chapters = new Vector.<QuizChapter>();
		}
		
		public function reset():void
		{
			_chapters.length=0;
		}
		
		public function addChapter(title:String):void
		{
			_chapters.push(new QuizChapter(title));
		}
		
		public function serialize():XML
		{
			var result:XML =<quiz_data/>;
			
			for each (var ch:QuizChapter in _chapters)
			{
				result.appendChild(ch.serialize);
			}
			
			return result;
		}
	}
}