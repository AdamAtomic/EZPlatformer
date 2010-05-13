package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
		public var level:FlxTilemap;
		public var exit:FlxSprite;
		public var coins:FlxGroup;
		public var player:FlxSprite;
		public var score:FlxText;
		public var status:FlxText;
		
		override public function create():void
		{
			//Set the background color to light gray (0xAARRGGBB)
			bgColor = 0xffaaaaaa;
			
			//Design your platformer level with 1s and 0s (at 40x30 to fill 320x240 screen)
			var data:Array = new Array(
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1,
				1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
				1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
				1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1,
				1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 );
			
			//Create a new tilemap using our level data
			level = new FlxTilemap();
			level.auto = FlxTilemap.AUTO;
			level.loadMap(FlxTilemap.arrayToCSV(data,40),FlxTilemap.ImgAuto);
			add(level);
			
			//Create the level exit, a dark gray box that is hidden at first
			exit = new FlxSprite(35*8+1,25*8);
			exit.createGraphic(14,16,0xff3f3f3f);
			exit.exists = false;
			add(exit);
			
			//Create coins to collect (see createCoin() function below for more info)
			coins = new FlxGroup();
			//Top left coins
			coins.add(createCoin(18,4));
			coins.add(createCoin(12,4));
			coins.add(createCoin(9,4));
			coins.add(createCoin(8,11));
			coins.add(createCoin(1,7));
			coins.add(createCoin(3,4));
			coins.add(createCoin(5,2));
			coins.add(createCoin(15,11));
			coins.add(createCoin(16,11));
			
			//Bottom left coins
			coins.add(createCoin(3,16));
			coins.add(createCoin(4,16));
			coins.add(createCoin(1,23));
			coins.add(createCoin(2,23));
			coins.add(createCoin(3,23));
			coins.add(createCoin(4,23));
			coins.add(createCoin(5,23));
			coins.add(createCoin(12,26));
			coins.add(createCoin(13,26));
			coins.add(createCoin(17,20));
			coins.add(createCoin(18,20));
			
			//Top right coins
			coins.add(createCoin(21,4));
			coins.add(createCoin(26,2));
			coins.add(createCoin(29,2));
			coins.add(createCoin(31,5));
			coins.add(createCoin(34,5));
			coins.add(createCoin(36,8));
			coins.add(createCoin(33,11));
			coins.add(createCoin(31,11));
			coins.add(createCoin(29,11));
			coins.add(createCoin(27,11));
			coins.add(createCoin(25,11));
			coins.add(createCoin(36,14));
			
			//Bottom right coins
			coins.add(createCoin(38,17));
			coins.add(createCoin(33,17));
			coins.add(createCoin(28,19));
			coins.add(createCoin(25,20));
			coins.add(createCoin(18,26));
			coins.add(createCoin(22,26));
			coins.add(createCoin(26,26));
			coins.add(createCoin(30,26));

			add(coins);
			
			//Create player (a red box)
			player = new FlxSprite(FlxG.width/2 - 5);
			player.createGraphic(10,12,0xffaa1111);
			player.maxVelocity.x = 80;
			player.maxVelocity.y = 200;
			player.acceleration.y = 200;
			player.drag.x = player.maxVelocity.x*4;
			add(player);
			
			score = new FlxText(2,2,80);
			score.shadow = 0xff000000;
			score.text = "SCORE: "+(coins.countDead()*100);
			add(score);
			
			status = new FlxText(FlxG.width-160-2,2,160);
			status.shadow = 0xff000000;
			status.alignment = "right";
			switch(FlxG.score)
			{
				case 0: status.text = "Collect coins."; break;
				case 1: status.text = "Aww, you died!"; break;
			}
			add(status);
		}
		
		//creates a new coin located on the specified tile
		public function createCoin(X:uint,Y:uint):FlxSprite
		{
			return new FlxSprite(X*8+3,Y*8+2).createGraphic(2,4,0xffffff00);
		}
		
		override public function update():void
		{
			//Player movement and controls
			player.acceleration.x = 0;
			if(FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x*4;
			if(FlxG.keys.SPACE && player.onFloor)
				player.velocity.y = -player.maxVelocity.y/2;
			
			//Updates all the objects appropriately
			super.update();
			
			//Check for player lose conditions
			if(player.y > FlxG.height)
			{
				FlxG.score = 1; //sets status.text to "Aww, you died!"
				FlxG.state = new PlayState();
				return;
			}
			
			//Check if player collected a coin or coins this frame
			FlxU.overlap(coins,player,getCoin);
			
			//Check to see if the player touched the exit door this frame
			FlxU.overlap(exit,player,win);
			
			//Finally, bump the player up against the level
			FlxU.collide(level,player);
		}
		
		//Called whenever the player touches a coin
		public function getCoin(Coin:FlxSprite,Player:FlxSprite):void
		{
			Coin.kill();
			score.text = "SCORE: "+(coins.countDead()*100);
			if(coins.countLiving() == 0)
			{
				status.text = "Find the exit.";
				exit.exists = true;
			}
		}
		
		//Called whenever the player touches the exit
		public function win(Exit:FlxSprite,Player:FlxSprite):void
		{
			status.text = "Yay, you won!";
			score.text = "SCORE: 5000";
			Player.kill();
		}
	}
}
