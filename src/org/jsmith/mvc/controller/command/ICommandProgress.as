package org.jsmith.mvc.controller.command
{
	/**
	 * 	The <code>ICommandProgress</code> interface enables execution progress to be monitored by
	 *  a listening object.
	 * 
	 *  @see org.jsmith.mvc.controller.command.ICommand
	 * 	@see org.jsmith.mvc.controller.command.Command
	 *  @see org.jsmith.mvc.controller.command.CompoundCommand
	 *  @see org.jsmith.mvc.controller.command.SequenceCommand
	 * 
	 * 	@author Justin Smith [justin@jsmith.org]
	 */
	public interface ICommandProgress
	{
		/**
		 * 	The percentage (as a double) of the current execution progress
		 *  of a <code>Command</code> object.
		 *  <p>Logic to determine this percentage must be included in the 
		 *  derived <code>Command</code> object.</p>
		 * 
		 *  @see org.jsmith.mvc.controller.command.Command
		 */
		function get percentComplete():Number;
		
	}//end interface
	
}//end package