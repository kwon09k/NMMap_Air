package nmmap.vo
{
	import com.mapquest.LatLng;

	[RemoteClass(alias="com.neimanmarcus.storeinformation.domain.StoreVO")]
	public class StoreVO implements IStoreInformation
	{
		private var _key:int;
		
		private var _storeNumber:int;
		private var _businessUnitCode:String;
		private var _subBusinessUnitCode:String;
		private var _subBusinessUnitDesc:String;
		private var _storeName:String;
		private var _abbrevCombine:String;
		private var _status:int;
		
		
		private var _street1:String;
		private var _street2:String;
		private var _city:String;
		private var _state:String;
		private var _country:String;
		private var _postalCode:int;
		
		private var _latLng:LatLng;
		private var _latitude:Number;
		private var _longitude:Number;
		
		private var _location:Location;
		
		

		public function get status():int
		{
			return _status;
		}

		public function set status(value:int):void
		{
			_status = value;
		}

		public function get location():Location
		{
			return _location;
		}

		public function set location(value:Location):void
		{
			_location = value;
		}

		public function get key():int
		{
			return _key;
		}
		public function set key(value:int):void
		{
			_key = value;
		}
		
		public function get latLng():LatLng
		{
			return _latLng;
		}

		public function set latLng(value:LatLng):void
		{
			_latLng = value;
			_latitude = value.lat;
			_longitude = value.lng;
		}

		public function get latitude():Number
		{
			return _latitude;
		}
		public function set latitude(value:Number):void
		{
			_latitude = value;
		}

		public function get longitude():Number
		{
			return _longitude;
		}
		public function set longitude(value:Number):void
		{
			_longitude = value;
		}

		public function get postalCode():int
		{
			return _postalCode;
		}

		public function set postalCode(value:int):void
		{
			_postalCode = value;
		}

		public function get country():String
		{
			return _country;
		}

		public function set country(value:String):void
		{
			_country = value;
		}

		public function get state():String
		{
			return _state;
		}

		public function set state(value:String):void
		{
			_state = value;
		}

		public function get city():String
		{
			return _city;
		}

		public function set city(value:String):void
		{
			_city = value;
		}

		public function get street2():String
		{
			return _street2;
		}

		public function set street2(value:String):void
		{
			_street2 = value;
		}

		public function get street1():String
		{
			return _street1;
		}

		public function set street1(value:String):void
		{
			_street1 = value;
		}

		public function get abbrevCombine():String
		{
			return _abbrevCombine;
		}

		public function set abbrevCombine(value:String):void
		{
			_abbrevCombine = value;
		}

		public function get storeName():String
		{
			return _storeName;
		}

		public function set storeName(value:String):void
		{
			_storeName = value;
		}

		public function get subBusinessUnitDesc():String
		{
			return _subBusinessUnitDesc;
		}

		public function set subBusinessUnitDesc(value:String):void
		{
			_subBusinessUnitDesc = value;
		}

		public function get subBusinessUnitCode():String
		{
			return _subBusinessUnitCode;
		}

		public function set subBusinessUnitCode(value:String):void
		{
			_subBusinessUnitCode = value;
		}

		public function get businessUnitCode():String
		{
			return _businessUnitCode;
		}

		public function set businessUnitCode(value:String):void
		{
			_businessUnitCode = value;
		}

		public function get storeNumber():int
		{
			return _storeNumber;
		}

		public function set storeNumber(value:int):void
		{
			_storeNumber = value;
		}

		
	}
}