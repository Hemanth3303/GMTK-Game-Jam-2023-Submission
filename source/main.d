module main;

import config;
import coin;
import raylib;
import std;

void main()
{
	validateRaylibBinding();
	InitWindow(windowProps.width, windowProps.height, windowProps.title);
	SetTargetFPS(windowProps.maxFps);

	float deltaTime=0.0f;
	Coin coin=new Coin(Vector2(windowProps.width/2, windowProps.height/2), Vector2(24, 24));
	
	while(!WindowShouldClose())
	{
		// begin update loop
		deltaTime=GetFrameTime();

		windowProps.update();
		coin.update(deltaTime);
		// end update loop

		// begin render loop
		BeginDrawing();
		ClearBackground(Colors.BLACK);

		coin.render();

		EndDrawing();
		// end render loop
	}
	CloseWindow();
}