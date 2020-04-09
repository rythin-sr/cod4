state("CoDWaW") {
    string50 map : 0x5592B8; 
	int loading1 : 0x3075B14;
    int squares1 : 0x14ED874;
    int landing1 : 0x2C594B8;
    int why : 0x32520E8;
    int Seen : 0x14E742C;
    int burne : 0x311CE00;
    int restless : 0x2C58E64; 
    int bloody : 0x504BF4;
    int ros : 0x133CAC4; 
    int evict :  0x14EF2AC;
    int Blow : 0x2C594B8;
    int Breaking : 0x30C987C;
    int heart : 0x3124678;
    int downboy : 0x4F985C;
}

startup {
    vars.missions = new Dictionary<string,string> { 
        {"pel1", "Little Resistance"}, 
        {"pel2", "Hard Landing"},
        {"sniper", "Vendetta"},
        {"see1", "Their Land, Their Blood"},
        {"pel1a", "Burn 'em Out"},
        {"pel1b", "Relentless"},
        {"see2", "Blood and Iron"},
        {"ber1", "Ring of Steel"},
        {"ber2", "Eviction"},
        {"pby_fly", "Black Cats"},
        {"oki2", "Blowtorch & Corkscrew"},
        {"oki3","Breaking Point"},
        {"ber3","Heart of the Reich"},
        {"ber3b","Downfall"},
    };
    vars.missionList = new List<string>();
    foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
        vars.splits = new List<string>();
    }

start
{
    return ((current.map == "mak") && (current.squares1 == 16384));
}

isLoading
{
    return (current.loading1 == 0) ||
    ((current.map == "mak") && (current.squares1 == 0)) ||
    ((current.map == "pel1") && (current.squares1 == 0)) ||
    ((current.map == "pel2") && (current.landing1 == 0)) ||
    ((current.map == "sniper") && (current.why == 1)) ||
    ((current.map == "see1") && (current.Seen == 0)) ||
    ((current.map == "pel1a") && (current.burne == 0)) ||
    ((current.map == "pel1b") && (current.restless == 0)) ||
    ((current.map == "see2") && (current.bloody == 0)) ||
    ((current.map == "ber1")  && (current.ros == 0)) ||
    ((current.map == "ber2") && (current.evict == 1)) ||
    ((current.map == "oki2") && (current.Blow == 0)) ||
    ((current.map == "oki3") && (current.Breaking == 0)) ||
    ((current.map == "ber3") && (current.heart == 0)) ||
    ((current.map == "ber3b") && (current.downboy == 0));
}

reset {
	return (old.map != "ui" && current.map == "ui");
}

split
{
  return (vars.missionList.Contains(current.map) && (current.map != old.map));
}