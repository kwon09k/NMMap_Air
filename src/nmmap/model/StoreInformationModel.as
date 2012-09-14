package nmmap.model
{
	
	import nmmap.events.ModelUpdateEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class StoreInformationModel extends Actor
	{
		
		private var _storeInformation:Array = [];
		private var _storeName:String = "";
		
		public function StoreInformationModel()
		{
			super();
		}
		
		public function get storeInformation():Array
		{
			return _storeInformation;
		}
		
		public function set storeInformation(value:Array):void
		{
			//storeInformation is an array of StoreVO
			_storeInformation = value;
			dispatch(new ModelUpdateEvent(ModelUpdateEvent.STORE_INFORMATION_MODEL_UPDATED_STORE_INFORMATION, _storeInformation));
		}
		
		public function updateStoreInformation(value:Array):void
		{
			_storeInformation = value;
			trace('model is updated for refresh');
			//TODO after this point. update poi's color and such.
		}

		public function set storeLatLng(latLng:Array):void
		{
			var length:int = latLng.length;
			
			for( var i:int = 0; i<length; i++)
			{	
				storeInformation[i].latLng = latLng[i];
			}
			
			dispatch(new ModelUpdateEvent(ModelUpdateEvent.UPDATE_LATITUDE_AND_LONGITUDE, latLng));
		}
		
		
		
	}
}