package  
{
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Player extends Tank 
	{
		
		
		public function Player() 
		{
			super();
			lives = 12;
		}
		override protected function init(e:Event):void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);				
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		private function onClick(e:MouseEvent):void 
		{
			shoot();
		}
		override public function update():void
		{
			if (directionPressed.x != 0)
			{
				rotateBody(directionPressed.x);
			}
			drive(directionPressed.y);
			rotateBarrel(stage.mouseX, stage.mouseY);
		}
		private function keyDown(e:KeyboardEvent):void 
		{
			switch(e.keyCode)
			{
				case Keyboard.W:
					directionPressed.y = -1;
					break;
				case Keyboard.S:
					directionPressed.y = 1;
					break;
				case Keyboard.A:
					directionPressed.x = -1;
					break;
				case Keyboard.D:
					directionPressed.x = 1;
					break;
			}
		}
		private function keyUp(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case Keyboard.W:
					directionPressed.y = 0;
					break;
				case Keyboard.S:
					directionPressed.y = 0;
					break;
				case Keyboard.A:
					directionPressed.x = 0;
					break;
				case Keyboard.D:
					directionPressed.x = 0;
					break;
			}
			
		}
		override public function die():void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);				
			stage.removeEventListener(MouseEvent.CLICK, onClick);
		}
			
		
	}

}