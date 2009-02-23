package com.glg.mvc.view
{
	/**
	 * 	The graphical component in our Model-View-Controller framework.
	 * 	<p><code>IView</code> provides a common interface for view
	 * 	components.</p>
	 * 
	 * 	@see com.glg.mvc.view.View
	 * 
	 * 	@author Justin Smith [justin.smith@glg.com]
	 */
	public interface IView
	{
		/**
		 * 	The unique ID of the view.
		 * 	<p>Used in the <code>ViewRegister</code> to keep
		 * 	track of the <code>IView</code>.</p>
		 * 
		 * 	@see com.glg.mvc.view.View
		 * 	@see com.glg.mvc.view.ViewRegister
		 */
		function get viewID():String;
		function set viewID(value:String):void;
		
		/**
		 * 	Returns a string representation of the <code>IView</code> object.
		 */
		function toString():String;
		
	}//end interface
	
}//end package