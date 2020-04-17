 state("iw5sp")
{
   int loading1 : 0x19ECCC4;
	string200 map : 0xB23C64;
	string200 map2 : 0xB23D0B;
	int poser : 0x18002C3;
	int dad : 0x5AC158;
}

startup {
vars.diamond1 = new Dictionary<string,string> { 
		{"harbor", "Hunter Killer"}, 
		{"ro", "Persona Non Grata"},
};

 vars.diamondaList = new List<string>();
		   foreach (var Tag in vars.diamond1) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.diamondaList.Add(Tag.Key); };


vars.diamond2 = new Dictionary<string,string> { 
		{"hijack", "Turbulence"},
		{"sp_warlord", "Back on the Grid"},
		{"london", "Mind the Gap"},
		{"hamburg", "Goalpost"},
		{"sp_payback", "Return To Sender"},
		{"paris_a", "Bag and Drag"},
		{"paris_ac130", "Iron Lady"},
		{"prague", "Eye of the Storm"},
		{"prague_escape", "Blood Brothers"}, 
		{"lin", "Stronghold"},
		{"sp_berlin", "Scorched Earth"},
		{"rescue_2", "Down the Rabbit Hole"},
		{"dubai", "Dust to Dust"},
		};  
	 vars.diamondbList = new List<string>();
		   foreach (var Tag in vars.diamond2) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.diamondbList.Add(Tag.Key); };
 }


split 
{
 return (vars.diamondbList.Contains(current.map) && (current.map != old.map)) || 
 (vars.diamondaList.Contains(current.map2) && (current.map2 != old.map2)) ||
 ((current.loading1 == 0) && (current.map != old.map) && (old.map == "prague_escape"));
}
 
 start
{
return ((current.map == "sp_ny_manhattan") && (current.dad != 0) && (current.loading1 != 0));
}
 
 reset
{
    return ((current.poser == 0) && (old.poser != 0));
}

isLoading
{
	 return (current.loading1 == 0);
}