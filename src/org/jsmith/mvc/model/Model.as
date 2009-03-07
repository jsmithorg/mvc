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
		public function get id():String { return _id; }
		public function set id(value:String):void 
		{ 
			//if this model has an id already, then it's probably
			//been registered and we need to remove it
			if(ModelRegister.getInstance().hasModel(_id))
				ModelRegister.getInstance().remove(_id);
				
			_id = value; 
			
			//we don't want to register a null id
			if(_id == null)
				return;
				
			//register our new view
			ModelRegister.getInstance().register(this);
		
		}//end property
		private var _id:String;
		
		public function Model(id:String = null)
		{
			this.id = id;
			
		}//end constructor
		
		/**
		 * 	@inheritDoc
		 */
		public function toString():String
		{
			return "[ Model id=\"" + _id + "\" ]";
				
		}//end method
		
	}//end class
	
}//end namespace