package nmmap.events
{
	import flash.events.Event;
	
	public class RequestStoreInformationDataEvent extends Event
	{
		
		public static const GET_STORE_LOCATIONS:String = "getStoreLocations";
		public static const REFRESH_STORE_LOCATIONS:String = "refreshStoreLocations";
		
		
		public function RequestStoreInformationDataEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new RequestStoreInformationDataEvent(type, bubbles, cancelable);
		}
		
	}
}