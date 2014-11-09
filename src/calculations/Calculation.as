package calculations 
{
	import flash.display.DisplayObject;
	
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Calculation 
	{
		
		
		public function Calculation() 
		{
			
		}
		public static function calculateRotationBetween(a:DisplayObject, b:DisplayObject):Number
		{
			var radians:Number = Math.atan2(b.y - a.y, b.x - a.x);		//degrees to radians: degrees * Math.PI / 180	
			var degrees:Number = radians * 180 / Math.PI;			
			return degrees;
		}
		public static function calculateMoveVector(angle:Number, speed:Number):MoveVector
		{
			var movement:MoveVector = new MoveVector();
			var radian:Number = angle * Math.PI / 180;
			movement.x = Math.cos(radian);
			movement.y = Math.sin(radian);
			movement.speed = speed;
			
		//	trace("calculation ", movement.x, movement.y, movement.speed);
			return movement;
		}
	
		
	}

}