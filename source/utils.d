module utils;

import coin;
import player;
import raylib;
import std.conv;

bool checkCollision(Coin coin, Player player)
{
	Rectangle coinRect=Rectangle(coin.pos.x, coin.pos.y, coin.size.x, coin.size.y);
	Rectangle playerRect=Rectangle(player.pos.x, player.pos.y, player.size.x, player.size.y);

	return CheckCollisionRecs(coinRect, playerRect);
}

void drawIntWithMessage(string message, int value, int x, int y)
{
	string text=message~to!string(value);
	DrawText(text.ptr, x, y, 32, Colors.WHITE);
}