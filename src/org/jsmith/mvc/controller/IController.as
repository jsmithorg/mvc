﻿package org.jsmith.mvc.controller{	import flash.events.Event;		public interface IController	{		function registerCommand(eventName:String, commandClass:Class):void;			function executeCommand(event:Event):void;			function removeCommand(eventName:String):void;			function hasCommand(eventName:String):Boolean;			function toString():String;			}//end interface	}//end package