package org.jsmith.mvc.controller.business
{
	import flash.events.*;
	
	import mx.rpc.events.ResultEvent;
    import mx.rpc.events.FaultEvent;
	
	public class BusinessDelegate extends EventDispatcher
	{
		protected function onResult(e:ResultEvent):void
		{
			dispatchEvent(e);
			
		}//end method
		
		protected function onFault(e:FaultEvent):void
		{
			dispatchEvent(e);
			
		}//end method
		
	}//end class
	
}//end package