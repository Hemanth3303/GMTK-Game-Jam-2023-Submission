module utils;

import coin;
import player;
import config;
import raylib;
import std.conv;

bool checkCollision(Coin coin, Player player)
{
	Rectangle coinRect=Rectangle(coin.pos.x, coin.pos.y, coin.size.x, coin.size.y);
	Rectangle playerRect=Rectangle(player.pos.x, player.pos.y, player.size.x, player.size.y);
	
	bool collides=CheckCollisionRecs(coinRect, playerRect);

	if(!coin.controlled && collides)
	{
		coin.ignored=true;
	}

	return collides && coin.controlled;
}

void drawIntWithMessage(string message, int value, int x, int y)
{
	string text=message~to!string(value);
	DrawText(text.ptr, x, y, 32, Colors.WHITE);
}

bool allExceptControlledDead(Coin[] coins)
{
	for(int i=1; i<MAX_COINS; i++)
	{
		if(coins[i].ignored==false)
		{
			return false;
		}
	}
	return true;
}