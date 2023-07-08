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

	Coin[20] allCoins;
	allCoins[0]=coin;

	for(int i=1; i<20; i++)
	{
		allCoins[i]=new Coin(
			Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
			Vector2(24, 24),
		);
	}

	bool start=false;
	int score=0;
	float timeSurvived=0.0f;
	
	while(!WindowShouldClose())
	{
		// begin update loop
		deltaTime=GetFrameTime();

		if(IsKeyPressed(KeyboardKey.KEY_SPACE) && !start)
		{
			start=true;
		}

		if(IsKeyPressed(KeyboardKey.KEY_R) && !start)
		{
			coin=new Coin(
				Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
				Vector2(24, 24),
				true
			);
			player=new Player(
				Vector2(GetRandomValue(0, windowProps.width-24), GetRandomValue(0, windowProps.height-24)), 
				Vector2(48, 48)
			);
			for(int i=1; i<20; i++)
			{
				allCoins[i]=new Coin(
					Vector2(GetRandomValue(0, windowProps.width-12), GetRandomValue(0, windowProps.height-12)), 
					Vector2(24, 24),
				);
			}
		}

		windowProps.update();
		if(start)
		{
			for(int i=0; i<20; i++)
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
			
			for(int i=0; i<20; i++)
			{
				if(checkCollision(allCoins[i], player))
				{
					start=false;
				}
			}
		}
		// end update loop

		// begin render loop
		BeginDrawing();
		ClearBackground(Colors.BLACK);

		for(int i=0; i<20; i++)
		{
			allCoins[i].render();
		}
		coin.render();
		player.render();
		drawIntWithMessage("Score: ", score, 20, 20);

		EndDrawing();
		// end render loop
	}
	CloseWindow();
}