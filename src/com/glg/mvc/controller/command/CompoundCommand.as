﻿package com.glg.mvc.controller.command{	import flash.events.Event;	import com.glg.mvc.controller.command.ICommand;	import com.glg.mvc.error.MVCError;		public class CompoundCommand extends Command implements ICommand	{		private var subCommands:Array;		private var completedCommands:int;		protected var compoundEvent:Event;				public function CompoundCommand()		{			this.subCommands = new Array();			this.completedCommands = 0;					}//end constructor			public function addSubCommand(command:ICommand):void		{			this.subCommands.push(command);					}//end method				public override function execute(event:Event = null):void		{			compoundEvent = event;						if(this.subCommands.length < 1)				throw new MVCError(MVCError.COMMAND_EMPTY);						for( var i:Number=0;i<this.subCommands.length;i++) 			{				var command:Command = this.subCommands[i] as Command;				command.addEventListener(Event.COMPLETE, onSubCommandComplete);				command.execute(event);						}//end for					}//end method				private function onSubCommandComplete(event:Event):void		{			this.completedCommands++;						if(this.completedCommands == this.subCommands.length)				this.dispatchEvent(new Event(Event.COMPLETE));					}//end method			}//end class	}//end package