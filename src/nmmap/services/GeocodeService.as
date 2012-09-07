package nmmap.services
{
	import com.mapquest.*;
	import com.mapquest.services.geocode.*;
	import com.mapquest.tilemap.*;
	import com.mapquest.tilemap.controls.inputdevice.*;
	import com.mapquest.tilemap.controls.shadymeadow.*;
	import com.mapquest.tilemap.pois.*;
	
	import nmmap.events.GeocodeServiceResponseEvent;
	import nmmap.events.MapEvent;
	import nmmap.model.PoiModel;
	
	import org.robotlegs.mvcs.Actor;
	
	public class GeocodeService extends Actor implements IGeocodeService
	{
		[Inject]
		public var model:PoiModel;
		
		private var _geocoder:Geocoder; 
		
		public function GeocodeService()
		{
			super();
//			_geocoder = new Geocoder("Fmjtd%7Cluua20u7n0%2C7g%3Do5-967556");
			_geocoder = new Geocoder("Jmjtd%7Clu6yn907nu%2C8w%3Do5-lw8x9");
			_geocoder.options.maxResults=1;
			_geocoder.addEventListener(GeocoderEvent.GEOCODE_ERROR_EVENT, _geocodeErrorHandler);
		}
		
		private function _geocodeErrorHandler(event:GeocoderEvent):void
		{
			trace("geocode failed");
		}
		
		public function doGeocode(address:Array):void
		{

			dispatch(new MapEvent(MapEvent.SET_BUSY_CURSOR));
			//add listeners to handle responses
			_geocoder.addEventListener(GeocoderEvent.GEOCODE_RESPONSE, onGeocodeResponse);
			
			
			//call the geocoder object's geocode method, passing the array of addresses
			_geocoder.geocode(address);
			
		}
		private function onGeocodeResponse(event:GeocoderEvent):void 
		{
			var latLng:Array=[];
			
			dispatch(new MapEvent(MapEvent.REMOVE_BUSY_CURSOR));
			trace("geocode done\n\n");
			
			_geocoder.removeEventListener(GeocoderEvent.GEOCODE_RESPONSE, onGeocodeResponse);

			//loop through the results grabbing each location
			for each (var loc:GeocoderLocation in event.geocoderResponse.locations) 
			{
				latLng.push(loc.displayLatLng);
			}
			
				
			//model.storeLatLng = latLng;
			dispatch(new GeocodeServiceResponseEvent(GeocodeServiceResponseEvent.GEOCODE_SERVICE_SUCCESS, latLng));

				
		}
	}
}