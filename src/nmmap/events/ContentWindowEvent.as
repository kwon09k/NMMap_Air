package nmmap.events
{
	import flash.events.Event;
	import flash.geom.Point;
	
	import nmmap.vo.StoreVO;
	
	public class ContentWindowEvent extends Event
	{
		public static const ADD_CONTENT_WINDOW:String = 'addContentWindow';
		public static const CLOSE_CONTENT_WINDOW:String = 'closeContentWindow';
		public static const REFRESH_CONTENT_WINDOW:String = 'refreshContentWindow';
		public static const WINDOW_CLOSED:String = 'windowClosed';
		
		
		private var _storeInfo:StoreVO;
		private var _x:int=NaN;
		private var _y:int=NaN;
		private var _point:Point;
		private var _index:int;
		
		public function ContentWindowEvent(type:String, storeInfo:StoreVO=null, point:Point=null, index:int=NaN, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_index = index;	
			_storeInfo = storeInfo;
			_point = point;
			super(type, bubbles, cancelable);
		}
		
		public function get index():int
		{
			return _index;
		}

		public function get storeInfo():StoreVO
		{
			return _storeInfo;
		}
		public function get point():Point
		{
			return _point;
		}
		public function get x():int
		{
			_x = _point.x;
			return _x;
		}
		public function get y():int
		{
			_y = _point.y;
			return _y;
		}
		
		override public function clone():Event
		{
			return new ContentWindowEvent(type, _storeInfo, _point, _index, bubbles, cancelable);
		}
		
	}
}