state("MW2CR")
{
	string50 map : 0x41758D1;
	int	 loading1 : 0x11B991A0;
}

startup {
vars.missions = new Dictionary<string,string> { 
		{"roadkill", "Team Player"},
		{"cliffhanger", "Cliffhanger"},
		{"airport", "No Russian"},
		{"favela", "Takedown"},
		{"invasion", "Wolverines"},
		{"favela_escape", "The Hornets Nest"},
		{"arcadia", "Exodus"},
		{"oilrig", "The Only Easy Day Was Yesterday"},
		{"gulag", "The Gulag"},
		{"dcburning", "Of Their Own Accord"},
		{"contingency", "Contingency"},
		{"dcemp", "Second Sun"}, 
		{"dc_whitehouse", "Whiskey Hotel"},
		{"estate", "Loose Ends"},
		{"boneyard", "The Enemy of My Enemy"},
		{"af_caves", "Just Like Old Times"},
		{"af_chase", "Endgame"},
		}; 
		  vars.missionList = new List<string>();
		   foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 }
 
 start
{
	 return ((current.map == "trainer") && (current.loading1 != 0));
}

 split {
        return (vars.missionList.Contains(current.map) && (current.map != old.map));
 }
 
 reset
{
    return ((current.map == "ui") && (old.map != "ui"));
}

isLoading
{
	return (current.loading1 == 1);
	
}
