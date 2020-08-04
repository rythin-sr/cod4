state("hedge")
{
    int levels : 0x3338B4;
    byte loading1 : 0x358CD4;
}

startup
    {

        settings.Add("l1", true, "Missions");

        vars.missions5 = new Dictionary<string,string> { 
        {"4","Inside Gladys' House"},
        {"5","Escape!"},
        {"6","Caught in the Hedge!"},
        {"7","Night Streets"},
        {"8","Projector Heist"},
        {"9","Martin Heist, Pt. 1"},
        {"10","Martin Heist, Pt. 2"},
        {"11","Martin House"},
        {"12","Martin House Escape"},
        {"13","Steam Train"},
        {"14","Shooting Gallery"},
        {"15","Maintenance Room"},
        {"16","Smith Birthday Party"},
        {"17","Smith Heist, Pt. 2"},
        {"18","Smith House"},
        {"19","Smith House Escape"},
        {"20","Cave Interiors"},
        {"21","Below Vincent's Den"},
        {"22","Mountain Paths"},
        {"23","Vincent's Den"},
        {"24","Conner Heist, Pt. 1"},
        {"25","Conner Heist, Pt. 2"},
        {"26","Conner Heist, Pt. 3"},
        {"27","Conner House"},
        {"28","Conner House Escape"},
        {"29","Mini-Golf Course"},
        {"30","Roller Coaster Tracks"},
        {"31","Roller Coaster Escape"},
        {"32","Gladys Heist, Pt. 1"},
        {"33","Gladys Heist, Pt. 2"},
        {"34","Gladys Heist Escape"},
        {"35","Protect The Woods!"},
        {"36","Vermtech Heist"},
        {"37","Rescue Heather!"},
};
   vars.missions5A = new List<string>();
    foreach (var Tag in vars.missions5) {
    settings.Add(Tag.Key, true, Tag.Value, "l1");
    vars.missions5A.Add(Tag.Key);
    };
}

init
{
    vars.doneMaps = new List<string>(); 
}

start
{
    if ((current.levels == 3) && (current.loading1 == 1)) {
        {
         vars.doneMaps.Clear();
		vars.doneMaps.Add(current.levels.ToString());
        return true;
    }
    }
}

split 
{
 string currentMap = current.levels.ToString();

        if ((currentMap != old.levels.ToString())) {
        if (!vars.doneMaps.Contains(currentMap)) {      
        if (settings[currentMap.Trim()]) {
        if (vars.missions5A.Contains(currentMap)) {
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

reset
{
    return (current.levels == 2);
}

isLoading
{
return (current.loading1 == 0);
}