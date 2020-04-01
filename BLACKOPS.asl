state("BlackOps")
{
	string70 map : 0x21033E8;
	long loading1: 0x1656804;	
}


startup {
vars.missions = new Dictionary<string,string> { 
		{"vorkuta", "Vorkuta"},
		{"pentagon", "USDD"},
		{"flashpoint", "Executive Order"},
		{"khe_sanh", "SOG"},
		{"hue_city", "The Defector"},
		{"kowloon", "Numbers"},
		{"fullahead", "Project Nova"},
		{"creek_1", "Victor Charlie"},
		{"river", "Crash Site"},
		{"wmd_sr71", "WMD"},
		{"pow", "Payback"}, 
		{"rebirth", "Rebirth"},
		{"int_escape", "Revelations"},
		{"underwaterbase", "Redemption"},
		{"outro", "Menu Screen"},
		}; 
		  vars.missionList = new List<string>();
		   foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 }
 
 start
{
	 return ((current.map == "cuba") && (old.map == "frontend"));
}

 split {
        return (vars.missionList.Contains(current.map) && (current.map != old.map));
 }
 
 reset
{
   return ((current.map == "frontend") && (old.map != "frontend"));
 
}

isLoading
{
	return (current.loading1 == 0);
}
