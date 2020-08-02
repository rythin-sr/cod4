state("t6sp")
{
	string65 map : 0xF4E62C;
	double loading1 : 0x1A002C0;
	string90 Bussy : 0xC18138;
	int exit : 0x2578DF0;
	//int oldwounds : 0x19FEF0C;
}

startup {
vars.missions = new Dictionary<string,string> {  
		{"monsoon.all.sabs", "Celerium"},
		{"afghanistan.all.sabs", "Old Wounds"},
		{"nicaragua.all.sabs", "Time and Fate"},
		{"pakistan_1.all.sabs", "Fallen Angel"},
		{"karma_1.all.sabs", "Karma"},
		{"panama.all.sabs", "Suffer With Me"},
		{"yemen.all.sabs", "Achilles Veil"},
		{"blackout.all.sabs", "Odysseus"},
		{"la_1.all.sabs", "Cordis Die"},
		{"haiti.all.sabs", "Judgment Day"},
		}; 
		  vars.missionList = new List<string>();
		   foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 }
 
 start
{
	 return ((current.map == "angola.all.sabs") && (old.map != "angola.all.sabs"));
}

 split {
        return (vars.missionList.Contains(current.map) && (current.map != old.map)) || ((current.Bussy == "haiti_gump_endings") && (current.exit != 0));
 }

isLoading
{
	return ((current.loading1 == 0) && (current.Bussy != "nicaragua_gump_josefina"))
	|| (current.map == "frontend.english.sabs") 
	|| (current.map == "frontend.all.sabs") 
	|| (current.map == "ts_afghanistan.all.sabs")
	|| (current.Bussy == "su_rts_mp_dockside");
	//|| ((current.oldwounds == 0) && (current.map == "afghanistan.all.sabs"))
}