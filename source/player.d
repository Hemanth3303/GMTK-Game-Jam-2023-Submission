module player;

import coin;
import config;
import raylib;
import std;

class Player
{
	Vector2 pos;
	Vector2 size;
	Vector2 vel;
	private immutable float SPEED=500.0f;

	this(Vector2 pos, Vector2 size)
	{
		this.pos=pos;
		this.size=size;
		this.vel=Vector2(0.0f, 0.0f);
	}

	public void update(float deltaTime, Coin coin)
	{
		pos.x=lerp(pos.x, coin.pos.x, 0.5*deltaTime);
		pos.y=lerp(pos.y, coin.pos.y, 0.5*deltaTime);
		checkBoundaryCollisions();
	}

	private void checkBoundaryCollisions()
	{
		if(pos.y+size.y>windowProps.height)
		{
			pos.y=windowProps.height-size.y;
		}
		if(pos.y<0.0f)
		{
			pos.y=0.0f;
		}
		if(pos.x<0.0f)
		{
			pos.x=0.0f;
		}
		if(pos.x+size.x>windowProps.width)
		{
			pos.x=windowProps.width-size.x;
		}
	}

	public void render()
	{
		DrawRectangle(to!int(pos.x), to!int(pos.y), to!int(size.x), to!int(size.y), Colors.RED);
	}
}