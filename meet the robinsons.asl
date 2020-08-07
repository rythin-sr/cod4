state("wilbur")
{
string50 maps : 0x328810;
string50 wrbro : 0x328897;
byte loading1 : 0x2FBC5C;
}

startup
{
    settings.Add("l1", false, "All Levels");
    settings.Add("l2", true, "WR Splits");

   vars.missions5 = new Dictionary<string,string> { 
        {"a1_robinson","Entering Robinson's house"},
        {"a1_robinson_storage","Storage Room"},
        {"a1_robinson_trainroom","Entering Training Room"},
        {"a1_robinsonhouse_ext","Exterior of House"},
        {"a1_subbasement","Entering Basement"},
        {"a1_subbasement2","Basement Part 2"},
        {"a1_subbasement3","Basement Part 3"},
        {"a1_subbasement_boss","Fighting Basement Boss"},
        {"a1_sciencefair","Science Fair"},
        {"a2_altfuture","Trainsit Station"},
        {"a2_altfuture_warehouse","Industrial District 1"},
        {"a2_oldtown","Old Town 1"},
        {"a2_altfuture_warehouse2","Future Warehouse Part 2"},
        {"a2_oldtown2","Old Town Part 2"},
        {"a2_lizzy","Hive"},
        {"a2_lizzy_boss","Hive Thrown Room"},
        {"a2_magma","Magma Industires Transit"},
        {"a2_magma_interior","Magma Industries Backdoor"},
        {"a2_prometheus","Magma Industries Prometheus"},
        {"a3_robinson","Robinson House Pre-Doris"},
        {"a3_industries","Doris Fight"},
    };
   vars.missions5A = new List<string>();
        foreach (var Tag in vars.missions5) {
        settings.Add(Tag.Key, true, Tag.Value, "l1");
        vars.missions5A.Add(Tag.Key);
        };

 vars.missions1 = new Dictionary<string,string> { 
        {@"a1_robinson_storage\","Garage Early"},
        {@"a1_subbasement\","Basement 1"},
        {@"a1_subbasement2\","Basement 2"},
        {@"a1_subbasement3\","Basement 3"},
        {@"a1_sciencefair\","Science Fair"},
        {@"a2_robinson\","Walk Through Walks"},
        {@"a2_altfuture_warehouse\","Industrial District"},
        {@"a2_oldtown\","Havoc Gloves Early"},
        {@"a2_oldtown2\","Starving Orphans Skip"},
        {@"a2_lizzy\","Hive Skip"},
        {@"a2_lizzy_boss\","Puzzle Skip"},
        {@"a2_prometheus\","Prometheus"},
        {@"a3_robinson\","Mega Dorris"},
};
 vars.missions1A = new List<string>();
        foreach (var Tag in vars.missions1) {
        settings.Add(Tag.Key, true, Tag.Value, "l2");
        vars.missions1A.Add(Tag.Key);
        };
}


init
{
 vars.doneMaps = new List<string>(); 
 vars.doneMaps2 = new List<string>(); 
}

start
{
 if ((current.maps == "a1_egypt")) {
        vars.doneMaps.Clear();
        vars.doneMaps2.Clear();
		vars.doneMaps.Add(current.maps);
        vars.doneMaps2.Add(current.wrbro);
        return true;
    }
}

split
{
 string currentMap = current.maps;
 string currentMap2 = current.wrbro;

    if ((currentMap != old.maps)) {
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

  if ((currentMap2 != old.wrbro)) {
        if (!vars.doneMaps2.Contains(currentMap2)) {      
            if (settings[currentMap2.Trim()]) {
            if (vars.missions1A.Contains(currentMap2)) {
                vars.doneMaps2.Add(currentMap2);
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
    return (current.maps == "fronted");
}

isLoading
{
    return (current.loading1 == 1);
}