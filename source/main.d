module main;

import config;
import raylib;

void main()
{
	validateRaylibBinding();
	InitWindow(config.WIN_WIDTH, config.WIN_HEIGHT, config.WIN_TITLE);
	SetTargetFPS(config.TARGET_FPS);

	float deltaTime=0.0f;
	
	while(!WindowShouldClose())
	{
		// begin update loop
		deltaTime=GetFrameTime();
		// end update loop

		// begin render loop
		BeginDrawing();
		ClearBackground(Colors.BLACK);
		DrawFPS(20, 20);

		DrawRectangle(640/2-25, 480/2-25, 50, 50, Colors.RED);

		EndDrawing();
		// end render loop
	}
	CloseWindow();
}