 state("iw3sp")
    {
  	int loading1 : 0x10B1100;
	string200 map : 0x6C3140;
	int boi : 0xCDE4C8;
    }

startup {
        settings.Add("act0", true, "Prologue");
        settings.Add("act1", true, "Act 1");
        settings.Add("act2", true, "Act 2");
        settings.Add("act3", true, "Act 3");

        vars.missions1 = new Dictionary<string,string> { 
		{"cargoship", "Crew Expendable"}, 
		{"coup", "The Coup"},
        };
        vars.missions1A = new List<string>();
        foreach (var Tag in vars.missions1) {
        settings.Add(Tag.Key, true, Tag.Value, "act0");
        vars.missions1A.Add(Tag.Key); 
        };

        vars.missions2 = new Dictionary<string,string> { 
		{"blackout", "blackout"},
		{"armada", "Charlie Dont Surf"},
		{"bog_a", "The Bog"},
		{"hunted", "Hunted"},	
		{"ac130", "Death From Above"},
		{"bog_b", "War Pig"},	
		{"airlift", "Shock and Awe"},
		{"aftermath", "Aftermath"},
        };

        vars.missions2A = new List<string>();
        foreach (var Tag in vars.missions2) {
        settings.Add(Tag.Key, true, Tag.Value, "act1");
        vars.missions2A.Add(Tag.Key); };

        vars.missions3 = new Dictionary<string,string> { 
		{"village_assault", "Safe House"},
		{"scoutsniper", "All Ghillied Up"}, 
		{"sniperescape", "One Shot, One Kill"},
		{"village_defend", "Heat"},
		{"ambush", "The Sins of the Father"},
        };
        vars.missions3A = new List<string>();
        foreach (var Tag in vars.missions3) {
        settings.Add(Tag.Key, true, Tag.Value, "act2");
        vars.missions3A.Add(Tag.Key); };
        
        vars.missions4 = new Dictionary<string,string> { 
		{"icbm", "Ultimatum"},
		{"launchfacility_a", "All In"},
		{"launchfacility_b", "No Fighting in The War Room"},
		{"jeepride", "Game Over"},
		};  
        
        vars.missions4A = new List<string>();
        foreach (var Tag in vars.missions4) {
        settings.Add(Tag.Key, true, Tag.Value, "act3");
        vars.missions4A.Add(Tag.Key); };
    }

init
    {
    vars.doneMaps = new List<string>(); 
    }

split
    {
    string currentMap = current.map;

    if ((currentMap != old.map)) {
        if (!vars.doneMaps.Contains(current.map)) {
            if (settings[currentMap.Trim()]) {
                if (vars.missions1A.Contains(currentMap) ||
                vars.missions2A.Contains(currentMap) ||
                vars.missions3A.Contains(currentMap) ||
                vars.missions4A.Contains(currentMap)) {
            vars.doneMaps.Add(current.map);
            return true;
            }
            else {
            return false;
            }
        }
        }
    }
    return ((current.map == "jeepride") && (current.boi == 139512));
    }   

start
    {
	if ((current.map == "killhouse") && (current.loading1 == 0)) {
    vars.doneMaps.Clear();
	vars.doneMaps.Add(current.map);
    return true;
    }
    }

 
 reset
    {
    return ((current.map == "ui") && (old.map != "ui")) && (old.map != "coup");
    }

  isLoading
    {
    return (current.loading1 == 0) || (current.map == "coup");
    }
