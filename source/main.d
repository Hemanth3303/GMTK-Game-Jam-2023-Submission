module main;

import raylib;
import std.stdio;
import std.conv;

void main()
{
	validateRaylibBinding();
	InitWindow(640, 480, "GMTK Game Jam 2023 Submission");
	SetTargetFPS(60);

	while(!WindowShouldClose())
	{
		BeginDrawing();
		ClearBackground(Colors.BLACK);
		
		float fps=GetFPS();
		string fpsStr="FPS: "~to!string(fps);
		DrawText(fpsStr.ptr, 20, 20, 32, Colors.WHITE);

		DrawRectangle(640/2-25, 480/2-25, 50, 50, Colors.RED);

		EndDrawing();
	}
	CloseWindow();
}