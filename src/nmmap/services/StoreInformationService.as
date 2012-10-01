package nmmap.services
{	
	import flash.events.AsyncErrorEvent;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestHeader;
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.events.ChannelEvent;
	import mx.messaging.events.ChannelFaultEvent;
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import nmmap.events.StoreInformationServiceResponseEvent;
	import nmmap.vo.Location;
	import nmmap.vo.StoreVO;
	
	import org.robotlegs.mvcs.Actor;
	
	public class StoreInformationService extends Actor implements IStoreInformationService
	{
		
		private var _remote:RemoteObject;
		
		public function StoreInformationService()
		{
			super();
			_configureRemote()
		}

		
//		http://expressdev1.nmg/storeInformation
		private function _configureRemote():void
		{
			//AMF request//
			
//			var serviceURI:String = "http://expressdev1.nmg/storeInformation";
//			var channel:AMFChannel = new AMFChannel("my-amf", serviceURI + "/messagebroker/amf");
//			var channelSet:ChannelSet = new ChannelSet();
//			
//			channelSet.addChannel( channel );
//			
//			channel.addEventListener(ChannelEvent.CONNECT, _onChannelConnect);
//			channel.addEventListener(ChannelEvent.DISCONNECT, _onChannelDisconnect);
//			channel.addEventListener(ChannelFaultEvent.FAULT, _onChannelFault);
//			
//			_remote = new RemoteObject();
//			_remote.destination = 'storeInformationService';
//			_remote.channelSet = channelSet;
			
			
			
			//URLRequest
			
			var request:URLRequest=new URLRequest();
			request.url="http://firdev1/nm_storeServices_json_amf/services/storeLocationServices/getStoreLocations"
			request.requestHeaders=[new URLRequestHeader("Content-Type", "application/json")];
			request.method=URLRequestMethod.GET;
			var loader:URLLoader=new URLLoader();
			loader.addEventListener(Event.COMPLETE, resultHandler);
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
		
			loader.load(request);
		}
		
		
		// HANDLERS
		private function securityErrorHandler(event:SecurityErrorEvent):void 
		{
			trace("securityErrorHandler: " + event);
		}
		
		private function httpStatusHandler(event:HTTPStatusEvent):void 
		{
			trace("httpStatusHandler: " + event);
		}
		
		private function ioErrorHandler(event:IOErrorEvent):void 
		{
			trace("ioErrorHandler: " + event);
		}
		
		
		private var _data:Array = [];
		protected function resultHandler(event:Event):void
		{
			var data:Object = JSON.parse(event.target.data);

			if ( data)
			{
				_data = data.result as Array;
			}
			else
				return;
			
			var storeData:Array = [];
			
			for each (var obj:Object in _data)
			{
				var storeInfo:StoreVO = new StoreVO();
				var storeLoc:Location = new Location();
				
				//Location object in storeVO				
				storeLoc.city = obj.location.city;
				storeLoc.country = obj.location.country;
				storeLoc.postalCode = obj.location.postalCode;
				storeLoc.state = obj.location.state;
				storeLoc.street1 = obj.location.street1;
				storeLoc.street2 = obj.location.street2;
				storeInfo.location = storeLoc;
				
				
				storeInfo.city = obj.location.city;
				storeInfo.country = obj.location.country;
				storeInfo.postalCode = obj.location.postalCode;
				storeInfo.state = obj.location.state;
				storeInfo.street1 = obj.location.street1;
				storeInfo.street2 = obj.location.street2;
				storeInfo.abbrevCombine = obj.abbrevCombine;
				storeInfo.businessUnitCode = obj.businessUnitCode;
//				storeInfo.status = obj.status;
				storeInfo.storeName = obj.storeName;
				storeInfo.storeNumber = obj.storeNumber;
				storeInfo.subBusinessUnitCode = obj.subBusinessUnitCode;
				storeInfo.subBusinessUnitDesc = obj.subBusinessUnitDesc;
				
				storeData.push(storeInfo);
			}
			
			
			
			
			dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, storeData));
			
//			dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, locations));
		}
		
		public function getStoreLocations():void
		{
//			var token:AsyncToken = _remote.getPhysicalStores();
//			var responder:Responder = new Responder(getStoreLocations_resultHandler, getStoreLocations_faultHandler); 
//			
//			token.addResponder( responder );
			
			
			
//			trace("getStoreLocation Called");
//			var stringArray:Array = [
//				
//				"getStoreLocation method called successfully", 
//				"This result will be the storeInformation."
//			
//			];
//			
//			dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, stringArray));
			
//			dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, _data));
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
			
			dispatch(new StoreInformationServiceResponseEvent(StoreInformationServiceResponseEvent.STORE_INFORMATION_SERVICE_SUCCESS, locations));
		}
		
		public function getStoreLocations_faultHandler(info:Object):void
		{
			trace("getStoreLocations_faultHandler is called");
		}
		
		
	}
}