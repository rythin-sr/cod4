state("blackops3") 
{
int loading1 : 0x19E00000;
string111 map1 : 0x156E5086;
}

startup
{
 vars.missions = new Dictionary<string,string> {  
	    {"newworld", "New World"},
        {"ackstation", "In Darkness"},
        {"odomes", "Provocation"},
        {"en", "Hypercenter"},
        {"ngeance", "Vengeance"},
        {"amses", "Rise and Fall"},
        {"nfection", "Demon Within"},
        {"quifer", "Sand Castle"},
        {"otus", "Lotus Towers"},
        {"coalescence", "Life"},
};

    vars.missionList = new List<string>();
		   foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 }

start
{
return ((current.map1 == "logue") && (current.loading1 != 0));
}

split
{
return (vars.missionList.Contains(current.map1) && (current.map1 != old.map1));
}

isLoading
{
 return (current.loading1 == 0);
}