package com.mynamespace.controllers
{
	import org.jsmith.mvc.controller.*;
	
	import com.mynamespace.controllers.commands.*;
	import com.mynamespace.events.*;
	
	public class AppController extends FrontController implements IController
	{
		public function AppController()
		{
			registerCommand(ApplicationEvent.INIT_APPLICATION, InitApplicationCommand);
			//registerCommand(OtherEvent.EVENT, OtherCommand);
			
		}//end constructor
		
	}//end class
	
}//end namespace