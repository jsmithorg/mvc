package com.mynamespace.models
{
	import org.jsmith.mvc.model.IModel;
	import org.jsmith.mvc.model.Model;
	
	import com.mynamespace.models.vo.MyValueObject;
	
	[Bindable]
	public class MyModel extends Model implements IModel
	{
		public static const ID:String = "someModel";
		
		public var myVO:MyValueObject;
		public var myVOArray:Array;
		
		public function MyModel(id:String = null)
		{
			super(id);
			
		}//end constructor
		
		public override function toString():String
		{
			return "[ SomeModel id=\"" + id + "\" ]";
			
		}//end method
		
	}//end class
	
}//end namespace