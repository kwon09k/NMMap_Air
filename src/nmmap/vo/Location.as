package nmmap.vo
{
	public class Location implements ILocation
	{
		
		private var _street1:String;
		private var _street2:String;
		private var _city:String;
		private var _state:String;
		private var _country:String;
		private var _postalCode:int;
		
//		public function Location(strt1:String=null, strt2:String=null, city:String=null, state:String=null, country:String=null, posCode:int=NaN)
//		{
//			_street1 = strt2;
//			_street2 = strt1;
//			_city = city;
//			_state = state;
//			_country = country;
//			_postalCode = posCode;
//		}

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

	}
}