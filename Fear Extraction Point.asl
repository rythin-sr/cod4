state("FEARXP")
{
    int loading1 : 0x2173B8;
    string60 map1 : 0x21007F;
    int cutscene : 0x214DA4;
}

startup
{
    vars.missions = new Dictionary<string,string> { 
    {"Church_02.World00p","Contamination - Metastasis"},
    {"Warehouse_01.World00p","Flight - Ambush"},
    {"Warehouse_02.World00p","Flight- Holiday"},
    {"Warehouse_03.World00p","flight- Desolation"},
    {"Subway_01.World00p","Descent - Terminus"},
    {"Subway_02.World00p","Descent - Orange Line"},
    {"Subway_03.World00p","Descent - The L"},
    {"Office_01.World00p","Malice - Leviathan"},
    {"Hospital_01.World00p","Extraction Point - Malignancy"},
    {"Hospital_02.World00p","Extraction Point - Dark Heart"},
    {"Hospital_03.World00p","Epilogue"},
    };

    vars.missionList = new List<string>();
	foreach (var Tag in vars.missions) {
    settings.Add(Tag.Key, true, Tag.Value);
    vars.missionList.Add(Tag.Key); };
	vars.splits = new List<string>();
}

start
{
    return (current.map1 == "Church_01.World00p");
    }

isLoading
{
    return (current.loading1 == 0) || (current.cutscene != 0);
    }

reset
{
    return (current.map1 == "XP_Intro.World00p");
    }

split
{
    return (vars.missionList.Contains(current.map1) && (current.map1 != old.map1));
    }