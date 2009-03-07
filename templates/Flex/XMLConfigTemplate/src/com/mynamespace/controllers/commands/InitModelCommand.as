package com.mynamespace.controllers.commands
{
	import flash.events.Event;
	
	import org.jsmith.mvc.controller.command.Command;
	import org.jsmith.mvc.controller.command.ICommand;
	import org.jsmith.mvc.model.*;
	
	import com.mynamespace.models.*;
	
	public class InitModelCommand extends Command implements ICommand
	{
		public override function execute(event:Event=null):void
		{
			//create any model's used in the application here
			
			//var model:SomeModel = new SomeModel(SomeModel.ID);
			
			onComplete();
			
		}//end method
		
	}//end class
	
}//end namespace