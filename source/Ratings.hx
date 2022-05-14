package;

import flixel.FlxG;

class Ratings
{
	public static function GenerateLetterRank(accuracy:Float, forReturn:Bool = false) // generate a letter ranking
	{
		var ranking:String = "N/A";
		var rating:String = "";

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
						ranking += " P";
						rating = "P";
					case 1:
						ranking += " X";
						rating = "X";
					case 2:
						ranking += " SS+";
						rating = "SS+";
					case 3:
						ranking += " SS-";
						rating = "SS-";
					case 4:
						ranking += " SS";
						rating = "SS";
					case 5:
						ranking += " S+";
						rating = "S+";
					case 6:
						ranking += " S-";
						rating = "S-";
					case 7:
						ranking += " S";
						rating = "S";
					case 8:
						ranking = " A+";
						rating = "A+";
					case 9:
						ranking = " A-";
						rating = "A-";
					case 10:
						ranking = " A";
						rating = "A";
					case 11:
						ranking = " B";
						rating = "B";
					case 12:
						ranking = " C";
						rating = "C";
					case 13:
						ranking = " D";
						rating = "D";
					case 14:
						ranking = " E";
						rating = "E";
					case 15:
						ranking += " F";
						rating = "F";
				}
				break;
			}
		}

		if (accuracy == 0)
			ranking = "N/A";

		if (forReturn == false){
			return ranking;
		} else {
			return rating;
		}
		
	}
}