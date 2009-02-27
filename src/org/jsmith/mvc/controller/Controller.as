﻿package org.jsmith.mvc.controller{	import org.jsmith.mvc.error.MVCError;		import flash.events.Event;		public class Controller implements IController	{		// Singleton instance		private static var instance:IController;				//our front controller		private var _frontController:IController;				///		///	Constructor		///				public function Controller(enforcer:SingletonEnforcer = null)		{			if(enforcer == null) 				throw new MVCError(MVCError.SINGLETON_ERROR);						}//end constructor			///		///	Static Methods		///				public static function getInstance():IController		{			if(instance == null) 				instance = new Controller(new SingletonEnforcer());							return instance;					}//end method			///		///	Public Methods		///				public function registerFrontController(controller:IController):void		{			if(_frontController != null)				throw new MVCError(MVCError.FRONT_CONTROLLER_NOT_NULL);							if(!(controller is FrontController))				throw new MVCError(MVCError.CLASS_NOT_FRONT_CONTROLLER, controller.toString());						_frontController = controller;					}//end method				public function executeCommand(event:Event):void		{			_frontController.executeCommand(event);					}//end method			public function registerCommand(eventName:String, commandClass:Class):void		{			_frontController.registerCommand(eventName, commandClass);					}//end method				public function hasCommand(eventName:String):Boolean		{			return _frontController.hasCommand(eventName);					}//end method			public function removeCommand(eventName:String):void		{			_frontController.removeCommand(eventName);					}//end method				public function toString():String		{			return _frontController.toString();					}//end method		}//end class	}//end packageinternal class SingletonEnforcer{}