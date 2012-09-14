package nmmap.controller
{
	import nmmap.events.StoreInformationServiceResponseEvent;
	import nmmap.model.StoreInformationModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class RefreshStoreLocationsCommand extends Command
	{
		[Inject]
		public var model:StoreInformationModel;
		[Inject]
		public var event:StoreInformationServiceResponseEvent;
		
		
		private var _locations:Array = [];
		
		public function RefreshStoreLocationsCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			super.execute();
			_locations = event.payload;
			
			model.updateStoreInformation(event.payload);
		}
	}
}