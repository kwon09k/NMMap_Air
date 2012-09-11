package nmmap.view
{
	import nmmap.events.ContentWindowEvent;
	import nmmap.events.HawaiiMapEvent;
	import nmmap.events.MapEvent;
	import nmmap.model.StoreInformationModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class HawaiiMapViewMediator extends Mediator
	{
		
		[Inject]
		public var view:HawaiiMapView;
		
		[Inject]
		public var model:StoreInformationModel;
		
		public function HawaiiMapViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			
			addViewListener(ContentWindowEvent.ADD_CONTENT_WINDOW, _addContentWindowHandler);
			addViewListener(ContentWindowEvent.REFRESH_CONTENT_WINDOW, _refreshContentWindowHandler);
			
			addContextListener(MapEvent.START_VIEW, _startViewHandler);
			addContextListener(HawaiiMapEvent.UPDATE_HAWAII_MAP, _updateHawaiiMapHandler);
			addContextListener(ContentWindowEvent.WINDOW_CLOSED, _windowClosedHandler);
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
		
		private function _startViewHandler(event:MapEvent):void
		{
			view.goToStartView();
		}
		
		
		private function _updateHawaiiMapHandler(event:HawaiiMapEvent):void
		{
			var storeInformation:Array=[];
			var latLng:Array=[];
			
			storeInformation = model.storeInformation;
			latLng = event.storeLatLng;
			
			view.setCoordinates(latLng);
			view.setLocationInformation(storeInformation);
			view.mapLocationData();
			
			
			trace(event.storeLatLng);
		}
	}
}