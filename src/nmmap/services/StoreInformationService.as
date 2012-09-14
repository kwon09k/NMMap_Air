package nmmap.services
{	
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.events.ChannelEvent;
	import mx.messaging.events.ChannelFaultEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.remoting.RemoteObject;
	
	import nmmap.events.StoreInformationServiceResponseEvent;
	
	import org.robotlegs.mvcs.Actor;
	
	public class StoreInformationService extends Actor implements IStoreInformationService
	{
		
		private var _remote:RemoteObject;
		private var isFirstTime:Boolean = true;
		
		public function StoreInformationService()
		{
			super();
			_configureRemote()
		}

		
//		http://expressdev1.nmg/storeInformation
		private function _configureRemote():void
		{
			var serviceURI:String = "http://expressdev1.nmg/storeInformation";
			var channel:AMFChannel = new AMFChannel("my-amf", serviceURI + "/messagebroker/amf");
			var channelSet:ChannelSet = new ChannelSet();
			
			channelSet.addChannel( channel );
			
			channel.addEventListener(ChannelEvent.CONNECT, _onChannelConnect);
			channel.addEventListener(ChannelEvent.DISCONNECT, _onChannelDisconnect);
			channel.addEventListener(ChannelFaultEvent.FAULT, _onChannelFault);
			
			_remote = new RemoteObject();
			_remote.destination = 'storeInformationService'
			_remote.channelSet = channelSet;
		}
		
		public function getStoreLocations():void
		{
			var token:AsyncToken = _remote.getPhysicalStores();
			var responder:Responder = new Responder(getStoreLocations_resultHandler, getStoreLocations_faultHandler); 
			
			token.addResponder( responder );
			
//			trace("getStoreLocation Called");
//			var stringArray:Array = [
//				
//				"getStoreLocation method called successfully", 
//				"This result will be the storeInformation."
//			
//			];
//			
//			dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, stringArray));
		}
		private function _onChannelConnect(event:ChannelEvent):void
		{
			trace("Conneceted.");	
		}
		private function _onChannelDisconnect(event:ChannelEvent):void
		{
			trace("Disconnected.");	
		}
		private function _onChannelFault(event:ChannelEvent):void
		{
			trace("Connect failed");
		}
		
		
		public function getStoreLocations_resultHandler(data:Object):void
		{
			trace("getStoreLocations_resultHandler\n\n\n");
			var locations:Array=[];
			if (data.result)
			{
				locations = data.result.source;
			}
			trace(locations);
			
			// isFirstTime boolean is true when the application starts, but after the service is called for first time,
			// it will indicate that it is not first time anymore. It will be used for refresh the service data.
			if(isFirstTime)
			{
				dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, locations));
				isFirstTime = false;
			}
			else
			{
				dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.REFRESH_STORE_INFORMATION_SERVICE_SUCCESS, locations));
			}
		}
		
		public function getStoreLocations_faultHandler(info:Object):void
		{
			trace("getStoreLocations_faultHandler is called");
		}
		
		
	}
}