package nmmap.events
{
	import flash.events.Event;

	public class ModelUpdateEvent extends Event
	{
		public static const UPDATE_LATITUDE_AND_LONGITUDE:String = "updateLatitudeAndLongitude";
		public static const GEOCODE_ADDRESS:String = "geocodeAdress";
		public static const STORE_INFORMATION_MODEL_UPDATED_STORE_INFORMATION:String = "storeInformationModelUpdatedStoreInformation";
		
		
		private var _updatedValue:Array = [];
		
		
		public function get updatedValue():Array
		{
			return _updatedValue;		
		}
		
		
		public function ModelUpdateEvent(type:String, updatedValue:Array, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_updatedValue = updatedValue;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ModelUpdateEvent(type, _updatedValue, bubbles, cancelable);
		}
	}
}