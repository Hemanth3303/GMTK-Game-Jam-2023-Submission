module main;

import config;
import utils;
import coin;
import player;
import raylib;
import std;

void main()
{
	validateRaylibBinding();
	InitWindow(windowProps.width, windowProps.height, windowProps.title);
	SetTargetFPS(windowProps.maxFps);

	float deltaTime=0.0f;
	Coin coin=new Coin(
		Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
		Vector2(24, 24),
		true
	);
	Player player=new Player(
		Vector2(GetRandomValue(0, windowProps.width-24), GetRandomValue(0, windowProps.height-24)), 
		Vector2(48, 48)
	);

	Coin[MAX_COINS] allCoins;
	allCoins[0]=coin;

	for(int i=1; i<MAX_COINS; i++)
	{
		allCoins[i]=new Coin(
			Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
			Vector2(24, 24),
		);
	}

	bool start=false;
	int score=0, highScore=0;
	float timeSurvived=0.0f;
	
	while(!WindowShouldClose())
	{
		// begin update loop
		deltaTime=GetFrameTime();
		if(IsKeyPressed(KeyboardKey.KEY_SPACE) && !start)
		{
			start=true;
			score=0;

			coin=new Coin(
				Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
				Vector2(24, 24),
				true
			);
			player=new Player(
				Vector2(GetRandomValue(0, windowProps.width-24), GetRandomValue(0, windowProps.height-24)), 
				Vector2(48, 48)
			);
			for(int i=1; i<MAX_COINS; i++)
			{
				allCoins[i]=new Coin(
					Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
					Vector2(24, 24),
				);
			}
			allCoins[0]=coin;
		}

		windowProps.update();
		if(start)
		{
			for(int i=0; i<MAX_COINS; i++)
			{
				allCoins[i].update(deltaTime);
			}
			player.update(deltaTime, allCoins);
			timeSurvived+=deltaTime;

			if(timeSurvived>=1.0f)
			{
				score++;
				timeSurvived=0.0f;
			}
			
			for(int i=0; i<MAX_COINS; i++)
			{
				if(checkCollision(allCoins[i], player))
				{
					start=false;
					if(score>highScore)
					{
						highScore=score;
					}
				}
			}
			if(allExceptControlledDead(allCoins))
			{
				for(int i=1; i<MAX_COINS; i++)
				{
					allCoins[i]=new Coin(
						Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
						Vector2(24, 24),
					);
				}
			}
		}
		// end update loop

		// begin render loop
		BeginDrawing();
		ClearBackground(Color(40, 40, 40, 255));

		if(start)
		{
			for(int i=0; i<MAX_COINS; i++)
			{
				allCoins[i].render();
			}
			coin.render();
			player.render();
			drawIntWithMessage("Score: ", score, MAX_COINS, MAX_COINS);
		}
		else
		{
			DrawText("Press Space to Start", 250, 150, 40, Colors.WHITE);
			DrawText("WASD to move", 320, 190, 40, Colors.WHITE);
			DrawText("You are Orange", 300, 230, 40, Colors.WHITE);
			DrawText("Don't let the player collect you, little coin", 50, 270, 40, Colors.WHITE);
			drawIntWithMessage("Previous Score: ", score, 330, 320);
			drawIntWithMessage("High Score: ", highScore, 360, 350);
		}

		EndDrawing();
		// end render loop
	}
	CloseWindow();
}