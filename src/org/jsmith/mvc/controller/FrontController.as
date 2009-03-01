﻿package org.jsmith.mvc.controller{	import flash.utils.Dictionary;	import flash.events.Event;		import org.jsmith.mvc.controller.IController;	import org.jsmith.mvc.controller.command.ICommand;	import org.jsmith.mvc.error.*;	import org.jsmith.mvc.events.MVCEventDispatcher;		public class FrontController implements IController	{		//our collection of command objects and their IDs		private var _commands:Dictionary;		private var _commandCount:int;				public function FrontController()		{			_commands = new Dictionary();			_commandCount = 0;					}//end constructor			/**		 * 	@inheritDoc		 */		public function executeCommand(event:Event):void		{			var type:String = event.type;			var commandClass:Class = this._commands[type] as Class;						if(commandClass == null)				throw new MVCError(MVCErrorCodes.COMMAND_NOT_FOUND, type);							var command:ICommand = new commandClass();			command.execute(event);					}//end method			/**		 * 	@inheritDoc		 */		public function registerCommand(eventName:String, commandClass:Class):void		{			if(!(new commandClass() is ICommand))				throw new MVCError(MVCErrorCodes.CLASS_NOT_ICOMMAND, commandClass.toString());							_commands[eventName] = commandClass;			_commandCount++;						MVCEventDispatcher.getInstance().addEventListener(eventName, executeCommand, false, 0, true);					}//end method				/**		 * 	@inheritDoc		 */		public function hasCommand(eventName:String):Boolean		{			return _commands[eventName] != null;				}//end method			/**		 * 	@inheritDoc		 */		public function removeCommand(eventName:String):void		{			// if the Command is registered...			if(hasCommand(eventName))			{				MVCEventDispatcher.getInstance().removeEventListener(eventName, executeCommand);								// remove the command				delete _commands[eventName];								_commandCount--;							}//end if					}//end method				/**		 * 	Returns a string representation of the <code>FrontController</code>		 */		public function toString():String		{			return "[ FrontController (" + _commandCount + " commands) ]";					}//end method		}//end class	}//end package