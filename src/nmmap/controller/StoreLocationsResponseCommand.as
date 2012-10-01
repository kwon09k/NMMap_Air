package nmmap.controller
{
	
	/**
	 * Store Locations Response Command
	 * 
	 * Author: yKwon
	 * Date: October 27, 2012
	 * 
	 * 
	 * 
	 */
	
	import nmmap.events.StoreInformationServiceResponseEvent;
	import nmmap.model.StoreInformationModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class StoreLocationsResponseCommand extends Command
	{
		[Inject]
		public var model:StoreInformationModel;
		[Inject]
		public var event:StoreInformationServiceResponseEvent;
		
		
		private var _locations:Array = [];
		private var _geocodeAddress:Array = [];
		
		public function StoreLocationsResponseCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			_locations = event.payload;
			
			model.storeInformation = event.payload;
			
		}
		
	}
}