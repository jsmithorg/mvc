package com.glg.mvc.view
{
	import flash.display.MovieClip;
	import flash.utils.Dictionary;
	
	import com.glg.mvc.controller.*;
	import com.glg.mvc.events.MVCEventDispatcher;
	import com.glg.mvc.model.*;
	
	/**
	 * 	The graphical component in our Model-View-Controller framework.
	 * 	<p><code>View</code> provides an abstract class with convenience
	 *  properties that access the 'Model,' 'View,' 'Controller' and event
	 * 	dispatching objects.</p>
	 * 
	 * 	@example To use the <code>View</code> class, create a concrete view
	 * 	that subclasses the abstract <code>View</code> class:
	 * 
	 * 	<listing version="3.0">
	 * 
	 * 		package
	 * 		{
	 * 			import com.glg.mvc.view.View;
	 * 			import com.glg.mvc.view.IView;
	 * 			...
	 * 
	 * 			public class MyClassView extends View implements IView
	 * 			{
	 * 				public function MyClassView()
	 * 				{
	 * 					...
	 * 				}
	 * 
	 * 			}
	 * 		}
	 * 	</listing>
	 * 
	 * 	@see com.glg.mvc.view.IView
	 * 	@see com.glg.mvc.view.ViewRegister
	 * 
	 * 	@author Justin Smith [justin.smith@glg.com]
	 */
	public class View extends MovieClip implements IView
	{
		/**
		 * 	The <code>ModelRegister</code> dictionary containing the active models.
		 * 
		 * 	@example To access an <code>IModel</code> object from the <code>model</code>
		 * 	convenience property:
		 * 
		 * 	<listing version="3.0">
		 * 
		 * 		package
		 * 		{
		 * 			import com.glg.mvc.view.View;
		 * 			import com.glg.mvc.view.IView;
		 * 			...
		 * 
		 * 			public class MyClassView extends View implements IView
		 * 			{
		 * 				public function MyClassView()
		 * 				{
		 * 					...
		 * 				}
		 * 
		 * 				public function myMethod():void
		 * 				{
		 * 					var model:IModel = model["myModelID"];
		 * 				}
		 * 			}
		 * 		}
		 * 	</listing>
		 * 
		 * 	@see com.glg.mvc.model.IModel
		 * 	@see com.glg.mvc.model.ModelRegister
		 */
		protected static var model:Dictionary = ModelRegister.getModels();
		
		/**
		 * 	The <code>Controller</code> instance.
		 * 	<p>In general, you will not need to use this. It's here, however, just in case.
		 * 	Normally, the commands will be invoked using the <code>MVCEventDispatcher</code>
		 * 	which then invokes <code>Controller</code>.  Because of this, you must invoke
		 * 	the <code>executeCommand</code> method using an <code>Event</code> object, and the
		 * 	<code>ICommand</code> must be registered in the controller to invoke with said <code>Event</code>.
		 * 
		 * 	@example To use the <code>Controller</code> instance to execute an <code>ICommand</code>:
		 * 
		 * 	<listing version="3.0">
		 * 
		 * 		package
		 * 		{
		 * 			public class MyClassView extends View implements IView
		 * 			{
		 * 				public function MyClassView()
		 * 				{
		 * 					...
		 * 				}
		 * 
		 * 				public function myMethod():void
		 * 				{
		 * 					//first the Command must be registered
		 * 					controller.registerCommand(Event.EVENT, MyCommandClass);
		 * 					
		 * 					...
		 * 
		 * 					//now it can be executed using 'executeCommand'
		 * 					var event:Event = new Event(Event.EVENT);
		 * 					controller.executeCommand(event);
		 * 				}
		 * 			}
		 * 		}
		 * 	</listing>
		 * 
		 * 	@see com.glg.mvc.events.MVCEvent
		 * 	@see com.glg.mvc.controller.command.Command
		 * 	@see com.glg.mvc.controller.FrontController
		 */
		protected static var controller:IController = Controller.getInstance();
		
		/**
		 * 	The <code>ViewRegister</code> dictionary containing the active views.
		 * 
		 * 	@example To access an <code>IView</code> object from the <code>view</code>
		 * 	convenience property:
		 * 
		 * 	<listing version="3.0">
		 * 
		 * 		package
		 * 		{
		 * 			import com.glg.mvc.view.View;
		 * 			import com.glg.mvc.view.IView;
		 * 			...
		 * 
		 * 			public class MyClassView extends View implements IView
		 * 			{
		 * 				public function MyClassView()
		 * 				{
		 * 					...
		 * 				}
		 * 
		 * 				public function myMethod():void
		 * 				{
		 * 					var view:IView = view["myViewID"];
		 * 				}
		 * 			}
		 * 		}
		 * 	</listing>
		 * 
		 * 	@see com.glg.mvc.view.IView
		 * 	@see com.glg.mvc.view.ViewRegister
		 */
		protected static var view:Dictionary = ViewRegister.getViews();
		
		/**
		 * 	The <code>MVCEventDispatcher</code> instance.
		 * 	<p>This is normally used in order to notify the <code>Controller</code> that
		 * 	it needs to execute an <code>ICommand</code>.</p>
		 *  
		 * 	@example To dispatch an event via the <code>MVCEventDispatcher</code>,
		 *  call its <code>dispatchEvent</code> method:
		 * 
		 * 	<listing version="3.0">
		 * 
		 * 		package
		 * 		{
		 * 			import com.glg.mvc.events.MVCEvent;
		 * 			...
		 * 
		 * 			public class MyClassView extends View implements IView
		 * 			{
		 * 				public function MyClassView()
		 * 				{
		 * 					myButton.addEventListener(MouseEvent.CLICK, onClick);
		 * 					...
		 * 				}
		 * 
		 * 				public function onClick(e:MouseEvent):void
		 * 				{
		 * 					var event:MVCEvent = new CustomMVCEvent(CustomMVCEvent.EVENT);
		 * 					mvcEventDispatcher.dispatchEvent(event);
		 * 				}
		 * 			}
		 * 		}
		 * 	</listing>
		 * 
		 * 	@see com.glg.mvc.events.MVCEvent
		 * 	@see com.glg.mvc.events.MVCEventDispatcher
		 */
		protected static var mvcEventDispatcher:MVCEventDispatcher = MVCEventDispatcher.getInstance();
		
		/**
		 * 	@inheritDoc
		 */
		public function get viewID():String { return _viewID; }
		public function set viewID(value:String):void { _viewID = value; }
		private var _viewID:String;
		
	}//end class
	
}//end package