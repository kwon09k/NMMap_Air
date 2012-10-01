 package nmmap.controller
{
	 
	 /**
	  * Updated Store Information Command
	  * 
	  * Author: yKwon
	  * Date: October 01, 2012
	  * 
	  * 
	  * 
	  */
	 
	import com.mapquest.services.geocode.GeocoderLocation;
	
	import nmmap.events.ModelUpdateEvent;
	import nmmap.model.StoreInformationModel;
	import nmmap.services.IGeocodeService;
	
	import org.robotlegs.mvcs.Command;
		
	public class UpdatedStoreInformationCommand extends Command
	{
		
		[Inject]
		public var model:StoreInformationModel;
		
		[Inject]
		public var event:ModelUpdateEvent;
		
		[Inject]
		public var service:IGeocodeService;
		
		private var _storeInfo:Array = [];
		private var _geocodeAddress:Array = [];
		
		public function UpdatedStoreInformationCommand()
		{
			super();
			
		}
		
		override public function execute():void
		{
			super.execute();
			
			//_locations is an array of StoreVO
			_storeInfo = event.updatedValue;
			
			var loc:GeocoderLocation;
			var length:int = _storeInfo.length;
			
			for(var i:int = 0; i < length; i++)
			{
				loc = new GeocoderLocation();
				loc.street = _storeInfo[i].location.street1;
				loc.city  = _storeInfo[i].location.city;
				loc.state = _storeInfo[i].location.state;
				loc.postalCode = _storeInfo[i].location.postalCode;
				loc.country = _storeInfo[i].location.country;
				
				_geocodeAddress[i] = loc;
				
//			trace(loc.street);
			}
			
			//use GeocoderLocation objects to geocode faster 
			service.doGeocode(_geocodeAddress);
		}
	}
}




