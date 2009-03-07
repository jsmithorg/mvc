package com.mynamespace.controllers.commands
{
	import flash.events.Event;
	
	import org.jsmith.mvc.controller.command.ICommand;
	import org.jsmith.mvc.controller.command.SequenceCommand;
	import org.jsmith.mvc.events.*;
	
	public class InitApplicationCommand extends SequenceCommand implements ICommand
	{
		public function InitApplicationCommand()
		{
			add(new InitModelCommand());
			add(new LoadConfigCommand());
			
			addEventListener(Event.COMPLETE, onCommandsComplete);
			
		}//end constructor
		
		private function onCommandsComplete(e:Event):void
		{
			//first event to dispatch - usually for selecting a default state
			//var event:MVCEvent = new OtherEvent(OtherEvent.EVENT, {event data});
			//event.dispatch();
			
		}//end method
		
	}//end class
	
}//end namespace