﻿package org.jsmith.mvc.controller.command{	import flash.events.*;	import flash.utils.Dictionary;		import org.jsmith.mvc.controller.*;	import org.jsmith.mvc.controller.command.ICommand;	import org.jsmith.mvc.error.*;	import org.jsmith.mvc.events.MVCEventDispatcher;	import org.jsmith.mvc.model.ModelRegister;	import org.jsmith.mvc.view.ViewRegister;		public class Command extends EventDispatcher implements ICommand, IEventDispatcher	{		protected static var model:Dictionary = ModelRegister.getModels();		protected static var controller:IController = Controller.getInstance();		protected static var view:Dictionary = ViewRegister.getViews();		protected static var mvcEventDispatcher:MVCEventDispatcher = MVCEventDispatcher.getInstance();				public function execute(event:Event = null):void 		{			throw new MVCError(MVCErrorCodes.ABSTRACT_METHOD_ERROR);					}//end method				public function undo(event:Event = null):void 		{			throw new MVCError(MVCErrorCodes.ABSTRACT_METHOD_ERROR);					}//end method				protected function onComplete():void		{			var e:Event = new Event(Event.COMPLETE);			dispatchEvent(e);					}//end method			}//end class	}//end package