package nmmap
{
	import flash.display.DisplayObjectContainer;
	
	import nmmap.controller.GeocodeResponseCommand;
	import nmmap.controller.GetStoreLocationsCommand;
	import nmmap.controller.RefreshStoreLocationsCommand;
	import nmmap.controller.StoreLocationsResponseCommand;
	import nmmap.controller.UpdatedStoreInformationCommand;
	import nmmap.events.GeocodeServiceResponseEvent;
	import nmmap.events.ModelUpdateEvent;
	import nmmap.events.RequestStoreInformationDataEvent;
	import nmmap.events.StoreInformationServiceResponseEvent;
	import nmmap.model.*;
	import nmmap.services.GeocodeService;
	import nmmap.services.IGeocodeService;
	import nmmap.services.IStoreInformationService;
	import nmmap.services.StoreInformationService;
	import nmmap.view.HawaiiMapView;
	import nmmap.view.HawaiiMapViewMediator;
	import nmmap.view.LegendMediator;
	import nmmap.view.MainViewMediator;
	import nmmap.view.MapButton;
	import nmmap.view.MapButtonMediator;
	import nmmap.view.MapLegend;
	import nmmap.view.MapView;
	import nmmap.view.MapViewMediator;
	
	import org.robotlegs.mvcs.Context;

	
	public class MapContext extends Context
	{
		public function MapContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			injector.mapSingleton(PoiModel);
			injector.mapSingleton(StoreInformationModel);
			
			mediatorMap.mapView(NMMapAir, MainViewMediator);
			mediatorMap.mapView(MapView, MapViewMediator);
			mediatorMap.mapView(MapButton, MapButtonMediator);
			mediatorMap.mapView(MapLegend, LegendMediator);
			mediatorMap.mapView(HawaiiMapView, HawaiiMapViewMediator);
			
			
			commandMap.mapEvent(GeocodeServiceResponseEvent.GEOCODE_SERVICE_SUCCESS, GeocodeResponseCommand);

			
			commandMap.mapEvent(RequestStoreInformationDataEvent.GET_STORE_LOCATIONS, GetStoreLocationsCommand);
			commandMap.mapEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, StoreLocationsResponseCommand);
			commandMap.mapEvent(StoreInformationServiceResponseEvent.REFRESH_STORE_INFORMATION_SERVICE_SUCCESS, RefreshStoreLocationsCommand);
			commandMap.mapEvent(ModelUpdateEvent.STORE_INFORMATION_MODEL_UPDATED_STORE_INFORMATION, UpdatedStoreInformationCommand);
			
			
			injector.mapSingletonOf(IGeocodeService, GeocodeService);
			injector.mapSingletonOf(IStoreInformationService, StoreInformationService);
		}
	}
}