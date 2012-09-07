package nmmap.events
{
	import flash.events.Event;
	
	public class HawaiiMapEvent extends Event
	{
		
		public static const UPDATE_HAWAII_MAP:String = 'updateHawaiiMap';
		
		private var _storeLatLng:Array = [];
		
		
		
		public function HawaiiMapEvent(type:String, storeLatLng:Array, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_storeLatLng = storeLatLng;
			
			super(type, bubbles, cancelable);
		}
		
		
		public function get storeLatLng():Array
		{
			return _storeLatLng;
		}


		override public function clone():Event
		{
			return new HawaiiMapEvent(type, _storeLatLng, bubbles, cancelable);
		}
	}
}