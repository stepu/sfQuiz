package events 
{
	import flash.events.Event;
	/**
	 * ...
	 * @author Michał Stepczuk
	 */
	public class AccountCreateEvent extends Event {
		public static const ACCOUNT_CREATE:String = "accountCreate"
		public var user:XML;
		
		
		public function AccountCreateEvent(user:XML) {
			super(ACCOUNT_CREATE);
			this.user = user;
			
		}
		
	}

}