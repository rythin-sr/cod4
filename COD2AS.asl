state("CoD2SP_s")
{
	string98 map : 0xCFEBD0;
	int loading1 : 0x415010;
}

startup {
		vars.missions = new Dictionary<string,string> { 
		{"demolition", "Demolition"},
		{"tunkhunt", "Repairing the Wire"},
		{"trainyard", "The Pipeline"},
		{"downtown_assault", "Downtown Assault"},
		{"cityhall", "City Hall"},
		{"downtown_sniper", "Comrade Sniper"},
		{"decoytrenches", "The Diversionary Raid"},
		{"decoytown", "Holding The Line"},
		{"elalamein", "Operation Supercharge"},
		{"eldaba", "The End of the Beginning"}, 
		{"libya", "Crusader Charge"},
		{"88ridge", "88 Ridge"},
		{"toujane_ride", "Outnumbered and Outgunned"},
		{"toujane", "Retaking Lost Ground"},
		{"matmata", "Assault on Matmata"},
		{"duhoc_assault", "The Battle of Pointe du Hoc"},
		{"duhoc_defend", "Defending the Pointe"},
		{"silotown_assault", "The Silo"},
		{"beltot", " Prisoners of War"},
		{"crossroads", "The Crossroads"},
		{"newvillers", "The Tiger"},
		{"breakout", "The Brigade Box"},
		{"bergstein", "Approaching Hill 400"},
		{"hill400_assault", "Rangers Lead the Way"}, 
		{"hill400_defend", " The Battle for Hill 400"},
		{"rhine", " Crossing the Rhine"},
		}; 
		  vars.missionList = new List<string>();
		   foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 	  }

start
{
	return ((current.map == "moscow") && (old.map == "movie_eastern"));
	}

 split {
    return (vars.missionList.Contains(current.map) && (current.map != old.map)) || (current.map == "credits");
	}
 
reset
{
	return ((current.map == "movie_eastern") && (old.map != "movie_eastern"));
	}

isLoading
{
	return (current.loading1 == 0);
	}

// IG with some help from Alexyeahnot (big on the "IG")