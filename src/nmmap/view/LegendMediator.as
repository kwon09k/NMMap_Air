package nmmap.view
{
	import nmmap.events.LegendEvent;
	import nmmap.events.MapEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class LegendMediator extends Mediator
	{
		
		[Inject]
		public var view:MapLegend;
		
		public function LegendMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			addContextListener(LegendEvent.ADD_STORE_NUMBER, _addStoreNumberHandler);
			
			addViewListener(MapEvent.SHOW_RED_POI, showRedHandler);
			addViewListener(MapEvent.SHOW_YELLOW_POI, showYellowHandler);
			addViewListener(MapEvent.SHOW_GREEN_POI, showGreenHandler);
			addViewListener(MapEvent.SHOW_ALL_POI, showAllHandler);
			
		}
		
		private function _addStoreNumberHandler(event:LegendEvent):void
		{
			view.addStoreNumber(event.payload);
		}
		
		
		protected function showRedHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_RED_POI));
		}
		protected function showYellowHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_YELLOW_POI));
		}
		protected function showGreenHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_GREEN_POI));
		}
		protected function showAllHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.SHOW_ALL_POI));
		}
	}
}