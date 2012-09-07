package nmmap.view
{
	import nmmap.events.MapEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MapButtonMediator extends Mediator
	{		
		public function MapButtonMediator()
		{
			super();
		}
		override public function onRegister():void
		{
			super.onRegister();
			
			
			addViewListener(MapEvent.SHOW_RED_POI, showRedHandler);
			addViewListener(MapEvent.SHOW_YELLOW_POI, showYellowHandler);
			addViewListener(MapEvent.SHOW_GREEN_POI, showGreenHandler);
			addViewListener(MapEvent.SHOW_ALL_POI, showAllHandler);
			addViewListener(MapEvent.START_VIEW, startViewHandler);
			
			
			addViewListener(MapEvent.ZOOM_IN, zoomInHandler);
			addViewListener(MapEvent.ZOOM_OUT, zoomOutHandler);
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
		protected function startViewHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.START_VIEW));
		}
		
		protected function zoomInHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.ZOOM_IN));
		}
		protected function zoomOutHandler(event:MapEvent):void
		{
			dispatch(new MapEvent(MapEvent.ZOOM_OUT));
		}
	}
}


