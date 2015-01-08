package mvc.models 
{
	/**
	 * ...
	 * @author liss
	 */
	public class QuizChapter 
	{
		public var title:String;
		
		public function QuizChapter(title:String) 
		{
			this.title = title;
		}
		
		public function deserialize(xml:XML):void
		{
			title = xml.@title.text();
		}
		
		public function serialize():XML
		{
			var result:XML =<chapter/>
			result.@title = title;
			
			return result;
		}
	}
}