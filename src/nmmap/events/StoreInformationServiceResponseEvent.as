package nmmap.events
{
	import flash.events.Event;

	
	public class StoreInformationServiceResponseEvent extends Event
	{
		public static const STORE_INFORMATION_SERVICE_SUCCESS:String = 'Store Information Service Success';
		public static const STORE_INFORMATION_SERVICE_FAULT:String = 'Store Information Service Fault';

		private var _payload:Array=[];
		
		
		public function get payload():Array
		{
			return _payload;
		}
		
		public function StoreInformationServiceResponseEvent(type:String, 
															 payload:Array,
															 bubbles:Boolean=false, cancelable:Boolean=false)
		{
			
			_payload = payload;
			super(type, bubbles, cancelable);
			
		}
		
		override public function clone():Event
		{
			return new StoreInformationServiceResponseEvent(type, _payload, bubbles, cancelable);
		}
		
		
	}
}