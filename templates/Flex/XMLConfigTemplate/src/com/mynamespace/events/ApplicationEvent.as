package com.mynamespace.events
{
	import org.jsmith.mvc.events.MVCEvent;
	
	public class ApplicationEvent extends MVCEvent
	{
		public static const INIT_APPLICATION:String = "initApplication";
		
		public function ApplicationEvent(type:String, data:* = null)
		{
			super(type, data);
		
		}//end constructor
		
	}//end class
	
}//end namespace