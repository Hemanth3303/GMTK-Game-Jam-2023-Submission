module main;

import config;
import raylib;
import std;

void main()
{
	validateRaylibBinding();
	SetConfigFlags(ConfigFlags.FLAG_WINDOW_RESIZABLE);
	InitWindow(windowProps.width, windowProps.height, windowProps.title);
	SetTargetFPS(windowProps.maxFps);

	float deltaTime=0.0f;
	
	while(!WindowShouldClose())
	{
		// begin update loop
		deltaTime=GetFrameTime();

		windowProps.update();
		// end update loop

		// begin render loop
		BeginDrawing();
		ClearBackground(Colors.BLACK);
		DrawFPS(20, 20);

		EndDrawing();
		// end render loop
	}
	CloseWindow();
}