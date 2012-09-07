package nmmap.events
{
	import flash.events.Event;
	
	public class GeocodeServiceResponseEvent extends Event
	{
		
		public static const GEOCODE_SERVICE_SUCCESS:String = 'geocodeServiceSuccess';
		public static const GEOCODE_SERVICE_FAULT:String = "geocodeServiceFault";
		public static const GEOCODING_SUCCESS:String = 'geocodingSuccess';
		
		private var _payload:Array;
		
		public function get payload():Array
		{
			return _payload;
		}
		
		
		public function GeocodeServiceResponseEvent(type:String, 
									
													payload:Array,
													bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_payload = payload;
			
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new GeocodeServiceResponseEvent(type, _payload, bubbles, cancelable);
		}
		
	}
}