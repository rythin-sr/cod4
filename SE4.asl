state("SniperElite4_DX11") {
    string100 map : 0xEB0BEB;
    float loading1 : 0xCFCAF0;
    float islandload : 0xC15A90; 
}

state("SniperElite4_DX12") {
  string100 map :  0xE5A2AB;
    float loading1 : 0xE55958;
  float islandload : 0xB683E0; 
}

startup
{
vars.missions = new Dictionary<string,string> { 
    	{"Marina", "Bianti Village"},
        {"Viaduct", "Regilino Viaduct"},
        {"Dockyard", "Lorino Dockyard"},
        {"Monte_Cassino", "Abrunza Monastery"},
        {"Coastal_Facility", "Magazzeno Facility"},
        {"Forest", "Giovi Fiorini Mansion"},
        {"Fortress", "allagra Fortress"},
};

  vars.missionList = new List<string>();
		   foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 }

 start
 {
return ((current.map == "Island") && (current.loading1 != 0));
 }

split
{
  return (vars.missionList.Contains(current.map) && (current.map != old.map));
}

 reset
 {
return ((current.map == "Island") && (old.map != "Island"));
 }

 isLoading
{
return ((current.loading1 == 0)) ||
  ((current.islandload == 0));
 }