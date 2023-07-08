module coin;

import config;
import raylib;
import std;

class Coin
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

	public void update(float deltaTime)
	{
		manageInputs();
		
		pos.x+=vel.x*SPEED*deltaTime;
		pos.y+=vel.y*SPEED*deltaTime;

		checkBoundaryCollisions();
		
	}

	private void manageInputs()
	{
		if(IsKeyDown(KeyboardKey.KEY_A))
		{
			vel.x=-1.0f;
		}
		else if(IsKeyDown(KeyboardKey.KEY_D))
		{
			vel.x=1.0f;
		}
		else
		{
			vel.x=0.0f;
		}
		if(IsKeyDown(KeyboardKey.KEY_W))
		{
			vel.y=-1.0f;
		}
		else if(IsKeyDown(KeyboardKey.KEY_S))
		{
			vel.y=1.0f;
		}
		else
		{
			vel.y=0.0f;
		}
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
		DrawRectangle(to!int(pos.x), to!int(pos.y), to!int(size.x), to!int(size.y), Colors.YELLOW);
	}
}