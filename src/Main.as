package 
{

	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Main extends Sprite 
	{
		private var lastFrame:Date = new Date();
		public static var deltaTime:Number;
		public static var tanks:Array;
		public static var bullets:Array;
		public static var main:Main;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			
			main = this;
			bullets = new Array();
			tanks = new Array();
			tanks.push(new Player());
			tanks.push(new Enemy());
			
			
			var l:int = tanks.length;
			for (var i:int = 0; i < l; i++) 
			{
				tanks[i].x = 200;
				tanks[i].y = 200;
				
				addChild(tanks[i]);
			}			
						
			this.addEventListener(Event.ENTER_FRAME, loop);
			
			
		}
		
		
		
		private function loop(e:Event):void 
		{
			var now:Date = new Date();
			deltaTime = (now.getTime() - lastFrame.getTime() )/ 1000;
						
			var tl:int = tanks.length;			
			for (var i:int = 0; i < tl; i++) 
			{
				var bl:int = bullets.length;
				var isHit:Boolean = false;
				tanks[i].update();
				for (var k:int = 0; k < bl; k++) 
				{
					if (tanks[i].hitTestPoint(bullets[k].x, bullets[k].y, true))
					{
						isHit = true;
						removeChild(bullets[k]);
						bullets.splice(k, 1);
						break;
					}
				}	
				if (isHit)
				{					
					tanks[i].lives--;
					if (tanks[i].lives <= 0)
					{
						tanks[i].die();
						removeChild(tanks[i]);						
						tanks.splice(i, 1);
						break;
					}
				}
				
			}
			bl = bullets.length;
			for (var j:int = 0; j < bl; j++) 
			{
				bullets[j].update();	
				
				
			}
			
			lastFrame = now;
		}
		
	}
	
}