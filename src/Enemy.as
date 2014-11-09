package  
{
	import calculations.Calculation;
	/**
	 * ...
	 * @author Erwin Henraat
	 */
	public class Enemy extends Tank 
	{
		
		public function Enemy() 
		{
			super();
			lives = 6;
		}
		override public function update():void
		{
			
	
		
			rotateBarrel(Main.tanks[0].x, Main.tanks[0].y)
			//super.update();
			
			
		}
		
	}

}