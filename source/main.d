module main;

import config;
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
	Coin coin=new Coin(Vector2(windowProps.width/2, windowProps.height/2), Vector2(24, 24));
	Player player=new Player(
		Vector2(GetRandomValue(0, windowProps.width), GetRandomValue(0, windowProps.height)), 
		Vector2(48, 48)
		);
	
	while(!WindowShouldClose())
	{
		// begin update loop
		deltaTime=GetFrameTime();

		windowProps.update();
		coin.update(deltaTime);
		player.update(deltaTime, coin);
		// end update loop

		// begin render loop
		BeginDrawing();
		ClearBackground(Colors.BLACK);

		coin.render();
		player.render();

		EndDrawing();
		// end render loop
	}
	CloseWindow();
}