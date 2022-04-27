package;

import flixel.FlxG;

class Ratings
{
	public static function GenerateLetterRank(accuracy:Float) // generate a letter ranking
	{
		var ranking:String = "N/A";

		if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods == 0) // Marvelous (SICK) Full Combo
			ranking = "(MFC)";
		else if (PlayState.misses == 0 && PlayState.bads == 0 && PlayState.shits == 0 && PlayState.goods >= 1) // Good Full Combo (Nothing but Goods & Sicks)
			ranking = "(GFC)";
		else if (PlayState.misses == 0) // Regular FC
			ranking = "(FC)";
		else if (PlayState.misses < 10) // Single Digit Combo Breaks
			ranking = "(SDCB)";
		else
			ranking = "(Clear)";

		// WIFE TIME :)))) (based on Wife3)

		var wifeConditions:Array<Bool> = [
			accuracy >= 99.9935, // AAAAA
			accuracy >= 99.980, // AAAA:
			accuracy >= 99.970, // AAAA.
			accuracy >= 99.955, // AAAA
			accuracy >= 99.90, // AAA:
			accuracy >= 99.80, // AAA.
			accuracy >= 99.70, // AAA
			accuracy >= 99, // AA:
			accuracy >= 96.50, // AA.
			accuracy >= 93, // AA
			accuracy >= 90, // A:
			accuracy >= 85, // A.
			accuracy >= 80, // A
			accuracy >= 70, // B
			accuracy >= 60, // C
			accuracy < 60 // D
		];

		for (i in 0...wifeConditions.length)
		{
			var b = wifeConditions[i];
			if (b)
			{
				switch (i)
				{
					case 0:
						ranking += " S++";
					case 1:
						ranking += " S+";
					case 2:
						ranking += " S-";
					case 3:
						ranking += " S";
					case 4:
						ranking += " A++";
					case 5:
						ranking += " A+";
					case 6:
						ranking += " A-";
					case 7:
						ranking += " A";
					case 8:
						ranking += " B++";
					case 9:
						ranking += " B+";
					case 10:
						ranking += " B-";
					case 11:
						ranking += " B";
					case 12:
						ranking += " C++";
					case 13:
						ranking += " C+";
					case 14:
						ranking += " C-";
					case 15:
						ranking += " C";
				}
				break;
			}
		}

		if (accuracy == 0)
			ranking = "N/A";

		return ranking;
	}
}