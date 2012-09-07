package nmmap.view
{
	import nmmap.events.ContentWindowEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class MainViewMediator extends Mediator
	{
		[Inject]
		public var view:NMMapAir;
		
		public function MainViewMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			super.onRegister();
			addViewListener(ContentWindowEvent.WINDOW_CLOSED, _windowClosedHandler);
			
			addContextListener(ContentWindowEvent.ADD_CONTENT_WINDOW, _addContentWindowHandler);
			addContextListener(ContentWindowEvent.REFRESH_CONTENT_WINDOW, _refreshContentWindowHandler);
		}
		
		private function _addContentWindowHandler(event:ContentWindowEvent):void
		{
			trace("addContentWindow "+event.storeInfo);
			view.addContentWindow(event.storeInfo, event.x, event.y);
		}
		private function _refreshContentWindowHandler(event:ContentWindowEvent):void
		{
			view.refreshContentWindow(event.storeInfo, event.x, event.y);
		}
		private function _windowClosedHandler(event:ContentWindowEvent):void
		{
			dispatch(new ContentWindowEvent(ContentWindowEvent.WINDOW_CLOSED,null,null, event.index));
		}
		
		
	}
}