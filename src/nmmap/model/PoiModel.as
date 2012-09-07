package nmmap.model
{
	import nmmap.events.ModelUpdateEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class PoiModel extends Actor
	{
		private var _storeLatLng:Array = [];
		
		
		
		public function PoiModel()
		{
			super();
		}
		
		
		public function get storeLatLng():Array
		{
			return _storeLatLng;
		}
		
		public function set storeLatLng(latLng:Array):void
		{
			//latLng is an Array of LatLNG
			_storeLatLng = latLng;
			
			
			dispatch(new ModelUpdateEvent(ModelUpdateEvent.UPDATE_LATITUDE_AND_LONGITUDE, latLng));
		}
		

		
	}
}