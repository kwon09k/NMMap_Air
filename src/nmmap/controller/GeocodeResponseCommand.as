package nmmap.controller
{
	
	/**
	 * Geocode Response Command
	 * 
	 * Author: yKwon
	 * Date: August 27, 2012
	 * 
	 * 
	 * 
	 */
	
	import nmmap.events.GeocodeServiceResponseEvent;
	import nmmap.model.StoreInformationModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class GeocodeResponseCommand extends Command
	{
		
		[Inject]
		public var model:StoreInformationModel;
		[Inject]
		public var event:GeocodeServiceResponseEvent;
		
		public function GeocodeResponseCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			
			model.storeLatLng = event.payload;
		}
	}
}