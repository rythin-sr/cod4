state("MW2CR")
{
	string6 decide: 0xA9809F;
    string50 map1 : 0x41758D1;
	int loading1 : 0x43784A8;
	}

state("MW2CR", "Default")
{
	string50 map1 : 0x42187F6;
	byte loading1 : 0x6509784;
	string6 decide: 0xA9809F;
	}

state("MW2CR", "1.1.12")
{
	string50 map1 : 0x41758D1;
	int loading1 : 0x43784A8;
	string6 decide: 0xA9809F;
	}

init
{
 if (current.decide == "1.1.12") {
    version = "1.1.12";
  	}
  else {
    version = "Default";
  	}
      vars.doneMaps = new List<string>(); 
	}


startup {
        settings.Add("act1", true, "Act 1");
        settings.Add("act2", true, "Act 2");
        settings.Add("act3", true, "Act 3");

        vars.missions2 = new Dictionary<string,string> { 
		{"trainier", "S.S.D.D."}, 
		{"roadkill", "Team Player"},
		{"cliffhanger", "Cliffhanger"},
		{"airport", "No Russian"},
		{"favela", "Takedown"},
        };

        vars.missions2A = new List<string>();
        foreach (var Tag in vars.missions2) {
        settings.Add(Tag.Key, true, Tag.Value, "act1");
        vars.missions2A.Add(Tag.Key); };

        vars.missions3 = new Dictionary<string,string> { 
		{"invasion", "Wolverines"},
		{"favela_escape", "The Hornets Nest"},
		{"arcadia", "Exodus"},
		{"oilrig", "The Only Easy Day Was Yesterday"},
		{"gulag", "The Gulag"},
		{"dcburning", "Of Their Own Accord"},
        };
        vars.missions3A = new List<string>();
        foreach (var Tag in vars.missions3) {
        settings.Add(Tag.Key, true, Tag.Value, "act2");
        vars.missions3A.Add(Tag.Key); };
        
        vars.missions4 = new Dictionary<string,string> { 
		{"contingency", "Contingency"},
		{"dcemp", "Second Sun"}, 
		{"dc_whitehouse", "Whiskey Hotel"},
		{"estate", "Loose Ends"},
		{"boneyard", "The Enemy of My Enemy"},
		{"af_caves", "Just Like Old Times"},
		{"af_chase", "Endgame"},
		{"ending", "End"},
        };
        
        vars.missions4A = new List<string>();
        foreach (var Tag in vars.missions4) {
        settings.Add(Tag.Key, true, Tag.Value, "act3");
        vars.missions4A.Add(Tag.Key); };
    }

start
    {
	if ((current.map1 == "trainer") && (current.loading1 != 0)) 
    {
    vars.doneMaps.Clear();
	vars.doneMaps.Add(current.map1);
    return true;
    }
    }

 isLoading
   {
	return ((current.loading1 == 1) && (current.decide == "1.1.12"));
	return ((current.loading1 == 0) && (current.decide != "1.1.12"));
    return (current.map1 == "ui");
	}
 
 reset
    {
    return ((current.map1 == "ui") && (old.map1 != "ui"));
    }

split
    {
    string currentMap = current.map1;

    if ((currentMap != old.map1)) {
        if (!vars.doneMaps.Contains(currentMap)) {
            if (settings[currentMap.Trim()]) {
                if (vars.missions2A.Contains(currentMap) ||
                vars.missions3A.Contains(currentMap) ||
                vars.missions4A.Contains(currentMap)) {
            vars.doneMaps.Add(currentMap);
            return true;
            }
            else {
            return false;
            }
        }
        }
    }
    }   
