package  
{
	import calculations.Calculation;
	import calculations.MoveVector;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Tank extends TankClip
	{
		protected var deltaTime:Number;
		static public const ON_SHOOT:String = "onShoot";
		protected var directionPressed:Point = new Point();
		protected var rotationSpeed:Number = 90;
		protected var moveSpeed:Number = 130;		
		public var lives:int = 10;
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);			
		}		
		protected function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);			
			
		}		
		public function update():void
		{				
					
			
			
		}			
		protected function drive(dDirection:Number):void 
		{			
			var move:MoveVector = Calculation.calculateMoveVector(this.rotation, moveSpeed);
			this.x += -dDirection * move.x * move.speed * Main.deltaTime;
			this.y += -dDirection * move.y * move.speed * Main.deltaTime;			
		}
		protected function rotateBarrel(targetX:Number, targetY:Number):void 
		{		
			
			var diffX:Number = targetX - this.x;
			var diffY:Number = targetY - this.y;					
			var radian:Number = Math.atan2( diffY, diffX);
			var angle:Number = radian * 180 / Math.PI;
			var barrelTargetAngle:Number = (angle - this.rotation);
			//var barrelCurrentRot:Number = this.barrel.rotation;			
			this.barrel.rotation = barrelTargetAngle;			
			//this.barrel.rotation +=  (barrelTargetAngle - barrelCurrentRot) * 0.1;
			
		}
		protected function shoot():void
		{
			var shell:Shell = new Shell();
			Main.bullets.push(shell);			
			
			
			shell.x = this.x;		
			shell.y = this.y;
			shell.rotation =  this.rotation + this.barrel.rotation;
			
			
			
			Main.main.addChildAt(shell, 0);
		}
		protected function rotateBody(rDirection:Number):void 
		{
			this.rotation += rDirection * rotationSpeed * Main.deltaTime;			
		}
		public function die():void
		{
			
		}
	}

}