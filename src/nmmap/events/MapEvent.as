package nmmap.events
{
	import flash.events.Event;
	
	public class MapEvent extends Event
	{
		
		public static const SHOW_RED_POI:String = "showRedPoi";
		public static const SHOW_YELLOW_POI:String = "showYellowPoi";
		public static const SHOW_GREEN_POI:String = "showGreenPoi";
		public static const SHOW_ALL_POI:String = "showAllPoi";
		public static const START_VIEW:String = "startView";
		
		
		public static const ZOOM_IN:String = "zoomIn";
		public static const ZOOM_OUT:String = "zoomOut";
		
		
		public static const POI_SELECTED:String = "poiSelected";
		
		public static const PLOT_LATLNG:String = "plotLatLng";
		public static const PLOT_GEOCODE:String = "plotGeocode";
		
		public static const GET_SERVICE:String = "getService";
		
		public static const SET_BUSY_CURSOR:String = "setBusyCursor";
		public static const REMOVE_BUSY_CURSOR:String = "removeBusyCursor";
		
		public static const ADD_VIEW_TO_THE_APPLICATION:String = "removeBusyCursor";
		
		public static const TESTING:String = "testing";
		
		
		
		public function MapEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new MapEvent(type);
		}
	}
}