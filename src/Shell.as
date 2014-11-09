package  
{
	import calculations.Calculation;
	import calculations.MoveVector;
	
	import flash.events.Event;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Shell extends ShellClip 
	{
		static public const COLLISION:String = "collision";
		private var m:MoveVector;
		
		public function Shell() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event):void 
		{
			
			removeEventListener(Event.ADDED_TO_STAGE, init);
			m = Calculation.calculateMoveVector(this.rotation, 500);
			
			this.x += m.x * 60;
			this.y += m.y * 60;
			
		}
		public function update():void
		{			
			move();
			
			
			
		}		
		
		
		
		private function move():void
		{		
			this.x += m.x * m.speed * Main.deltaTime;
			this.y += m.y * m.speed * Main.deltaTime;
		}
		
		
	}

}