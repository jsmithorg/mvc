package org.jsmith.mvc.model
{
	/**
	 * 	The state-keeping component in our Model-View-Controller framework.
	 * 	<p><code>Model</code> provides an abstract class for model objects
	 *  in the MVC framework.</p>
	 * 
	 * 	@example To use the <code>Model</code> class, create a concrete model
	 * 	that subclasses the abstract <code>Model</code> class:
	 * 
	 * 	<listing version="3.0">
	 * 
	 * 		package
	 * 		{
	 * 			import org.jsmith.mvc.model.Model;
	 * 			import org.jsmith.mvc.model.IModel;
	 * 			...
	 * 
	 * 			public class MyClassModel extends Model implements IModel
	 * 			{
	 * 				public function MyClassModel()
	 * 				{
	 * 					...
	 * 				}
	 * 
	 * 			}
	 * 		}
	 * 	</listing>
	 * 
	 * 	@see org.jsmith.mvc.model.IModel
	 * 	@see org.jsmith.mvc.model.ModelRegister
	 * 
	 * 	@author Justin Smith [justin@jsmith.org]
	 */
	public class Model implements IModel
	{
		/**
		 * 	@inheritDoc
		 */
		public function get modelID():String { return _modelID; }
		public function set modelID(value:String):void 
		{ 
			//if this model has an id already, then it's probably
			//been registered and we need to remove it
			if(ModelRegister.getInstance().hasModel(_modelID))
				ModelRegister.getInstance().remove(_modelID);
				
			_modelID = value; 
			
			//register our new view
			ModelRegister.getInstance().register(this, _modelID);
		
		}//end property
		private var _modelID:String;
		
		/**
		 * 	@inheritDoc
		 */
		public function toString():String
		{
			return "[ Model id=" + _modelID + " ]";
				
		}//end method
		
	}//end class
	
}//end namespace