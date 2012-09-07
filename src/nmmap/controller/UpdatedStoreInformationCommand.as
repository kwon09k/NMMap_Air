 package nmmap.controller
{
	 
	 /**
	  * Updated Store Information Command
	  * 
	  * Author: yKwon
	  * Date: August 27, 2012
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
		
		private var _locations:Array = [];
		private var _geocodeAddress:Array = [];
		
		public function UpdatedStoreInformationCommand()
		{
			super();
			
		}
		
		override public function execute():void
		{
			super.execute();
			
			
			_locations = event.updatedValue;
			
			var loc:GeocoderLocation;
			var length:int = _locations.length;
			
			for(var i:int = 0; i < length; i++)
			{
				loc = new GeocoderLocation();
				loc.street = _locations[i].street1;
				loc.city  = _locations[i].city;
				loc.state = _locations[i].state;
				loc.postalCode = _locations[i].postalCode;
				loc.country = _locations[i].country;
				
				_geocodeAddress[i] = loc;
				
			trace(loc.street);
			}
			service.doGeocode(_geocodeAddress);
		}
	}
}




