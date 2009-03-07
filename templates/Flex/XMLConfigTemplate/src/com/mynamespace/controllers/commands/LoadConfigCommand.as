package com.mynamespace.controllers.commands
{
	import flash.events.Event;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.jsmith.mvc.controller.command.Command;
	import org.jsmith.mvc.controller.command.ICommand;
	import org.jsmith.mvc.events.MVCEvent;
    
    import com.mynamespace.controllers.business.ConfigDelegate;
    import com.mynamespace.models.MyModel;
	
	public class LoadConfigCommand extends Command implements ICommand
	{
		public override function execute(event:Event = null):void
		{
			var url:String = (event as MVCEvent).data as String;
			
			var configDelegate:ConfigDelegate = new ConfigDelegate(url);
			configDelegate.addEventListener(ResultEvent.RESULT, onResult);
			configDelegate.addEventListener(FaultEvent.FAULT, onFault);
			configDelegate.getConfig(); 
			
		}//end method
		
		private function onResult(e:ResultEvent):void
		{
			var config:XML = e.result as XML;
		
			//var myModel:MyModel = model[MyModel.ID] as MyModel;
			//myModel.myVOArray = parseConfigData(config);
			
			onComplete();
			
		}//end method
		
		private function onFault(e:FaultEvent):void
		{
			//error loading config
			
		}//end method
		
	}//end class
	
}//end namespace