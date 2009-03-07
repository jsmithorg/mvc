package org.jsmith.mvc.view
{
	/**
	 * 	The graphical component in our Model-View-Controller framework.
	 * 	<p><code>IView</code> provides a common interface for view
	 * 	components.</p>
	 *  <p><a target="_blank" href="http://en.wikipedia.org/wiki/Model-view-controller">Model-View-Controller</a> on Wikipedia</p>
	 * 
	 * 	@see org.jsmith.mvc.view.View
	 * 
	 * 	@author Justin Smith [justin@jsmith.org]
	 */
	public interface IView
	{
		/**
		 * 	The unique ID of the view.
		 * 	<p>Used in the <code>ViewRegister</code> to keep
		 * 	track of the <code>IView</code>.</p>
		 * 
		 * 	@see org.jsmith.mvc.view.View
		 * 	@see org.jsmith.mvc.view.ViewRegister
		 */
		function get id():String;
		function set id(value:String):void;
		
		/**
		 * 	Returns a string representation of the <code>IView</code> object.
		 */
		function toString():String;
		
	}//end interface
	
}//end package