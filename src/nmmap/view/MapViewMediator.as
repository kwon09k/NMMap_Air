package nmmap.view
{
	import nmmap.events.ContentWindowEvent;
	import nmmap.events.HawaiiMapEvent;
	import nmmap.events.LegendEvent;
	import nmmap.events.MapEvent;
	import nmmap.events.ModelUpdateEvent;
	import nmmap.events.RequestStoreInformationDataEvent;
	import nmmap.model.StoreInformationModel;
	
	import org.robotlegs.mvcs.Mediator;


	/**
	 * Mediator for Mapview
	 * 
	 * Author: yKwon
	 * Date:
	 * User:
	 * 
	 * 
	 */
	
	
	
	public class MapViewMediator extends Mediator
	{
		[Inject]
		public var view:MapView;
		
		[Inject]
		public var model:StoreInformationModel;
		
		
		// ------ constuctor -------
		public function MapViewMediator()
		{
			super();
		}
		
		
		// ------- override method -------
		override public function onRegister():void
		{
			addViewListener(ContentWindowEvent.ADD_CONTENT_WINDOW, _addContentWindowHandler);
			addViewListener(ContentWindowEvent.REFRESH_CONTENT_WINDOW, _refreshContentWindowHandler);
			
			
			addContextListener(ContentWindowEvent.WINDOW_CLOSED, _windowClosedHandler);
			
			
			addContextListener(ModelUpdateEvent.UPDATE_LATITUDE_AND_LONGITUDE, _updateCoordinates);
			
			addContextListener(MapEvent.SET_BUSY_CURSOR, _setBusyCursor);
			addContextListener(MapEvent.REMOVE_BUSY_CURSOR, _removeBusyCursor);
			
			
			
			addContextListener(MapEvent.SHOW_RED_POI, _showRedHandler);
			addContextListener(MapEvent.SHOW_YELLOW_POI, _showYellowHandler);
			addContextListener(MapEvent.SHOW_GREEN_POI, _showGreenHandler);
			addContextListener(MapEvent.SHOW_ALL_POI, _showAllHandler);
			addContextListener(MapEvent.START_VIEW, _startViewHandler);
			
			addContextListener(MapEvent.ZOOM_IN, _zoomInHandler);
			addContextListener(MapEvent.ZOOM_OUT, _zoomOutHandler);
			
			

			addViewListener(LegendEvent.ADD_STORE_NUMBER, _addStoreNumberHandler);
			
			dispatch(new RequestStoreInformationDataEvent(RequestStoreInformationDataEvent.GET_STORE_LOCATIONS));

			
		}
		
		
		// ------- Event Handler ------
		// onEnventName 
		// handleEventName
		// eventNameHandler

		private function _addStoreNumberHandler(event:LegendEvent):void
		{
			dispatch(new LegendEvent(LegendEvent.ADD_STORE_NUMBER, event.payload));
		}
		
		private function _updateCoordinates(event:ModelUpdateEvent):void
		{
			
			var storeInformation:Array=[];
			var latLng:Array=[];
			storeInformation = model.storeInformation;
			latLng = event.updatedValue;
			
			view.setCoordinates(latLng);
			view.setLocationInformation(storeInformation);
			view.mapLocationData();
			
			dispatch(new HawaiiMapEvent(HawaiiMapEvent.UPDATE_HAWAII_MAP, event.updatedValue));
			
		}
		
		private function _setBusyCursor(event:MapEvent):void
		{
			view.setBusyCursor();
		}
		private function _removeBusyCursor(event:MapEvent):void
		{
			view.removeBusyCursor();
		}
		
		
		
		private function _showRedHandler(event:MapEvent):void
		{
			view.showRedPoi();
		}
		private function _showYellowHandler(event:MapEvent):void
		{
			view.showYellowPoi();
		}
		private function _showGreenHandler(event:MapEvent):void
		{
			view.showGreenPoi();
		}
		private function _showAllHandler(event:MapEvent):void
		{
			view.showAllPoi();
		}
		private function _startViewHandler(event:MapEvent):void
		{
			view.goToStartView();
//			dispatch(new MapEvent(MapEvent.START_VIEW));
		}
		
		
		private function _zoomInHandler(event:MapEvent):void
		{
			view.customZoomIn();
		}
		private function _zoomOutHandler(event:MapEvent):void
		{
			view.customZoomOut();
		}
		
		
		
		private function _addContentWindowHandler(event:ContentWindowEvent):void
		{
			dispatch(new ContentWindowEvent(ContentWindowEvent.ADD_CONTENT_WINDOW, event.storeInfo, event.point));
		}
		private function _refreshContentWindowHandler(event:ContentWindowEvent):void
		{
			dispatch(new ContentWindowEvent(ContentWindowEvent.REFRESH_CONTENT_WINDOW, event.storeInfo, event.point));
		}
		private function _windowClosedHandler(event:ContentWindowEvent):void
		{
			view.contentWindowClosed(event);
		}
		
	}
}