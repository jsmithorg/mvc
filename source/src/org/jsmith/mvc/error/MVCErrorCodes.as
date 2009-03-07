package org.jsmith.mvc.error
{
	import flash.utils.Dictionary;
	
	public class MVCErrorCodes extends Dictionary
	{
		public static const SINGLETON_ERROR:String = "singletonError";
		public static const ABSTRACT_METHOD_ERROR:String = "abstractMethodError";
		public static const COMMAND_NOT_FOUND:String = "commandNotFound";
		public static const CLASS_NOT_ICOMMAND:String = "classNotICommand";
		public static const DISPLAY_OBJECT_IS_NULL:String = "displayObjectIsNull";
		public static const COMMAND_EMPTY:String = "commandEmpty";
		public static const SERVICE_NOT_FOUND:String = "serviceNotFound";
		public static const FRONT_CONTROLLER_NOT_NULL:String = "frontControllerNotNull";
		public static const CLASS_NOT_FRONT_CONTROLLER:String = "classNotFrontController";
		public static const VIEW_ID_NOT_SET:String = "viewIDNotSet";
		public static const MODEL_ID_NOT_SET:String = "modelIDNotSet";
		
		public static function get messages():Dictionary { return _messages; }
		private static var _messages:Dictionary;
		
		{
			_messages = new Dictionary();
			
			_messages[SINGLETON_ERROR] = "the class is a singleton, to access the instance, please use the static method getInstance() instead";
			_messages[ABSTRACT_METHOD_ERROR] = "abstract method must be overridden in the subclass";
			_messages[COMMAND_NOT_FOUND] = "command not found for event";
			_messages[CLASS_NOT_ICOMMAND] = "class must implement the ICommand interface";
			_messages[DISPLAY_OBJECT_IS_NULL] = "an IView instance must be instantiated with a DisplayObject";
			_messages[COMMAND_EMPTY] = "complex command is empty.  Add ICommands with addSubCommand before executing";
			_messages[SERVICE_NOT_FOUND] = "the specified service was not found";
			_messages[FRONT_CONTROLLER_NOT_NULL] = "the front controller can only be set once";
			_messages[CLASS_NOT_FRONT_CONTROLLER] = "the class must extend FrontController";
			_messages[VIEW_ID_NOT_SET] = "viewID must be set before registering the IView";
			_messages[MODEL_ID_NOT_SET] = "modelID must be set before registering the IModel";
			
		}//end static initializer
		
	}//end class
	
}//end namespace