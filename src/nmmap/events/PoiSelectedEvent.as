package nmmap.events
{
	import flash.events.Event;
	
	public class PoiSelectedEvent extends Event
	{
		private var _index:int;
		
		public static const GET_INDEX_OF_SELECTED_POI:String = "getIndexOfSelectedPoi";
		
		public function PoiSelectedEvent(type:String, index:int, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, index, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new PoiSelectedEvent(type, _index, bubbles, cancelable);
		}
		
	}
}