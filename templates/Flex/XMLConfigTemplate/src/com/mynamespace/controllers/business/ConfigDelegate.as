package com.mynamespace.controllers.business
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.*;
	import flash.xml.XMLDocument;
	
	import mx.rpc.Fault;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.jsmith.mvc.controller.business.BusinessDelegate;
	import org.jsmith.mvc.controller.business.IBusinessDelegate;
	
	/**
	 * Dispatched when a <code>BusinessDelegate</code> 
	 * has successfully returned a result.
	 * 
	 * @eventType mx.rpc.events.ResultEvent
	 */
	[Event(name="result", type="mx.rpc.events.ResultEvent")]
	
	/**
	 * Dispatched when a <code>BusinessDelegate</code> 
	 * has failed to return a result.
	 * 
	 * @eventType mx.rpc.events.FaultEvent
	 */
	[Event(name="fault", type="mx.rpc.events.FaultEvent")]
	
	public class ConfigDelegate extends BusinessDelegate implements IBusinessDelegate
	{
		public function get config():XML { return _config; }
		private var _config:XML;
		
		private var _url:String;
		private var _request:URLRequest;
		private var _loader:URLLoader;
		
		public function ConfigDelegate(url:String)
		{
			_url = url;
			
			_request = new URLRequest(_url);
		 	_loader = new URLLoader();
			_loader.addEventListener(Event.COMPLETE, onComplete);
			_loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			_loader.dataFormat = URLLoaderDataFormat.TEXT;
			
		}//end constructor
		
		public function getConfig():void
		{
			_loader.load(_request);
			
		}//end method
		
		private function onComplete(e:Event):void
		{
			var loader:URLLoader = e.target as URLLoader;
			_config = new XML(new XMLDocument(loader.data));
			
			var event:ResultEvent = new ResultEvent(ResultEvent.RESULT, false, true, _config);
			
			dispatchEvent(event);
			
		}//end method
		
		private function onError(e:IOErrorEvent):void
		{
			var fault:Fault = new Fault("", e.text);
			var event:FaultEvent = new FaultEvent(FaultEvent.FAULT, false, true, fault);
			
			dispatchEvent(event);
			
		}//end method
		
	}//end class
	
}//end namespace