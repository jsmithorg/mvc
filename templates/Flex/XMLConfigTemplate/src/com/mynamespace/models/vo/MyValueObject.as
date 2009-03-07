package com.mynamespace.models.vo
{
	import org.jsmith.mvc.model.IValueObject;
	
	[Bindable]
	public class MyValueObject implements IValueObject
	{
		public var prop1:String;
		public var prop2:Date;
		public var prop3:String;
		public var prop4:String;
		
		public function toString():String 
		{
			return "[ MyValueObject prop1=\"" + prop1 + 
			           "\" prop2=\"" + prop2 + 
			           "\" prop3=\"" + prop3 + 
			           "\" prop4=\"" + prop4 + "\" ]";
			
		}//end method
		
	}//end class
	
}//end namespace