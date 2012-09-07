package nmmap.view
{
	import air.update.events.UpdateEvent;
	
	import nmmap.events.HawaiiMapEvent;
	import nmmap.events.MapEvent;
	import nmmap.events.ModelUpdateEvent;
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
			addContextListener(MapEvent.START_VIEW, _startViewHandler);
			addContextListener(HawaiiMapEvent.UPDATE_HAWAII_MAP, _updateHawaiiMapHandler);
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