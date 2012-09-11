package nmmap.events
{
	import flash.events.Event;
	
	public class LegendEvent extends Event
	{
		public static const ADD_STORE_NUMBER:String = 'addStoreNumber';		
		
		private var _payload:Array;
		
		public function LegendEvent(type:String, payload:Array=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_payload = payload;
			super(type, bubbles, cancelable);
		}
		
		public function get payload():Array
		{
			return _payload;
		}
		
		override public function clone():Event
		{
			return new LegendEvent(type, _payload, bubbles, cancelable);
		}
		
	}
}