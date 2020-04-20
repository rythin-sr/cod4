state("FEARXP2")
{
    int loading1 : 0x2193D0;
    string90 map : 0x21208C;
    int cutscene : 0x216DC4;
    }

startup
{
    vars.missions = new Dictionary<string,string> { 
    {"Sewer.World00p","Investigation - Underneath"},
    {"Streets.World00p","Investigation - Firefight"},
    {"Data_Center.World00p","Revelation - Rescue and Recon"},
    {"Computer_Core.World00p","Revelation - Disturbance"},
    {"Landing_Zone.World00p","Apprehension - Pacification"},
    {"Research_facility.World00p","Apprehension - Bio-Research"},
    {"Plaza.World00p","Apprehension - The Plaza Chase"},
    {"Underground.World00p","Devastation - Buried"},
    {"Subway.World00p","Devastation - The Deep"},
    {"Train_Yard.World00p","Infiltration - Relic"},
    {"Headquarters.World00p","Infiltration - Base Camp"},
    {"Mine.World00p","Exploration - Labyrinth"},
    {"Clone_Labs.World00p","Extermination - Clone Facility"},
    {"Clone_Production.World00p","Extermination - Clone Production"},
    {"Escape.World00p","Extermination - Showdown"},
    };

    vars.missionList = new List<string>();
	foreach (var Tag in vars.missions) {
    settings.Add(Tag.Key, true, Tag.Value);
    vars.missionList.Add(Tag.Key); };
	vars.splits = new List<string>();
}

start
{
    return (current.map == "Introduction.World00p");
    }

isLoading
{
    return (current.loading1 == 0) ||
    (current.cutscene != 0);
    }

split
{
    return (vars.missionList.Contains(current.map) && (current.map != old.map));

}