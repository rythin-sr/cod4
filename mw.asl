 state("iw3sp")
{
  	int loading1 : 0x10B1100;
	string200 map : 0x6C3140;
	int boi : 0xCDE4C8;
}

startup {
vars.missions = new Dictionary<string,string> { 
		{"cargoship", "Crew Expendable"}, 
		{"coup", "The Coup"},
		{"blackout", "blackout"},
		{"armada", "Charlie Dont Surf"},
		{"bog_a", "The Bog"},
		{"hunted", "Hunted"},
		{"ac130", "Death From Above"},
		{"bog_b", "War Pig"},
		{"airlift", "Shock and Awe"},
		{"aftermath", "Aftermath"},
		{"village_assault", "Safe House"},
		{"scoutsniper", "All Ghillied Up"}, 
		{"sniperescape", "One Shot, One Kill"},
		{"village_defend", "Heat"},
		{"ambush", "The Sins of the Father"},
		{"icbm", "Ultimatum"},
		{"launchfacility_a", "All In"},
		{"launchfacility_b", "No Fighting in The War Room"},
		{"jeepride", "Game Over"},
		};  
	 vars.missionList = new List<string>();
		   foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 }


split {
        return (vars.missionList.Contains(current.map) && (current.map != old.map)) || ((current.map == "jeepride") && (current.boi == 139512));
 }
 
 start
{
	 return ((current.map == "killhouse") && (current.loading1 == 0));
}
 
 reset
{
    return ((current.map == "ui") && (old.map != "ui")) && (old.map != "coup");
}

 isLoading
{
     return (current.loading1 == 0) || (current.map == "coup");
}
