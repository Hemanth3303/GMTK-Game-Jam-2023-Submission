module config;

import raylib;
import raygui;
import std.conv;

immutable size_t MAX_COINS=25;

struct WindowProps
{
	int width;
	int height;
	float aspectRatio;
	const char* title;
	const int maxFps;

	this(int width, int height, const char* title, int maxFps)
	{
		this.width=width;
		this.height=height;
		this.aspectRatio=to!float(this.width)/to!float(this.height);
		this.title=title;
		this.maxFps=maxFps;
	}

	private void updateDimensions()
	{
		this.width=GetScreenWidth();
		this.height=GetScreenHeight();
	}

	private void recalculateAspectRatio()
	{
		this.aspectRatio=to!float(this.width)/to!float(this.height);
	}

	public void update()
	{
		updateDimensions();
		recalculateAspectRatio();
	}
}

WindowProps windowProps=WindowProps(960, 540, "Avoid Collection", 60);