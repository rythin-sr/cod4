state("h1_sp64_ship")
{
	string4 decide: 0x6668D4C;
}

 state("h1_sp64_ship","default")
{
   int loading1 : 0x1226507C;
	string200 map : 0x443C652;
	string4 decide: 0x6668D4C;
}

state("h1_sp64_ship","1.13")
{
byte loading1 : 0x11C000A0;
string200 map : 0x45FF434;
string4 decide: 0x6668D4C;
}

state("h1_sp64_ship","1.15")
{
	int loading1: 0xC7C3430;
	string200 map : 0x45FF196;
	string4 decide: 0x6668D4C;
}

init
{
 if (current.decide == "1.15") {
    version = "1.15";
  }
  else {
    version = "1.13";
  }

  if ((current.decide != "1.15") && (current.decide != "1.13")) {
	  version = "default";
  }
}

startup {
vars.missions = new Dictionary<string,string> { 
		{"cargoship", "Crew Expendable"}, 
		{"coup", "The Coup"},
		{"blackout", "blackout"},
		{"ts_armada", "Charlie Dont Surf"},
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
        return (vars.missionList.Contains(current.map) && (current.map != old.map));
 }
 
 start
{
	 return ((current.map == "killhouse") && (current.loading1 == 0));
}
 
 reset
{
    return ((current.map == "ui") && (old.map != "ui"));
}

 isLoading
{
	if ((current.decide == "1.15") && (current.loading1 == 1)) {
		return true;
	}

	if ((current.decide == "1.13") && (current.loading != 0)) {
		return true;
	}

	if ((current.decide != "1.15") && (current.deicde != "1.13") && (current.loading == 0))
	{
		return true;
	}
}