state("OpenSeason")
{
    int loading1 : 0x6880F0;
    string110 map : 0x6880EC;
}


startup {
vars.missions = new Dictionary<string,string> {  
{"OS_TimberlineRide", "Timberline"}, 
{"OS_TimberlinePuni", "Puni Mart Picnic"},
{"OS_TheLedge", "Wake In The Wild"}, 
{"OS_ForestSkunks", "Meet The Skunks"},
{"OS_ElliotRosie", "Hoof It!"}, 
{"OS_ForestLoggers", "Scare Bear"},
{"OS_Mine", "Mine Shafted"}, 
{"OS_Journey", "Hunted!"},
{"OS_SnowballRide", "Snow Blitz"}, 
{"OS_Marsh", "Crazy Quackers"},
{"OS_ElliotDuckCall", "Fowl Duty"}, 
{"OS_ElliotTurret1", "Duck And Cover"},
{"OS_BeaverDam", "Beaver Damage"}, 
{"OS_OuthouseRide", "Rocky River"},
{"OS_ShawsCabin", "Shaw's Shack"}, 
{"OS_DawnBattleTheLedge", "Start The Battle"},
{"OS_ElliotTurretClanTree", "Protect The Clan's Tree"}, 
{"OS_ElliotPropaneTank", "Tanks A Lot"},
{"OS_DawnBattleTheMarsh", "Clear The Ducks"}, 
{"OS_DawnBattleForest", "The Trouble With Trappers"}, 
{"OS_ElliotTurretBeaver", "Toothy Torpedoes"}, 
{"OS_ElliotChainsaw", "Chainsaw Cha Cha"}, 
{"OS_DawnBattleBeaverDam", "Reilly's Rampage"}, 
{"OS_FinalBattle", "Shaw Showdown"},
}; 
	 vars.missionList = new List<string>();
	      foreach (var Tag in vars.missions) {
        settings.Add(Tag.Key, true, Tag.Value);
        vars.missionList.Add(Tag.Key); };
		vars.splits = new List<string>();
 }

 start
 {
    return ((current.map != "menu") && (current.map == "OS_Daisyfield"));
 }

 split
 {
      return (vars.missionList.Contains(current.map) && (current.map != old.map));
 }

 isLoading
{
return ((current.loading1 == 0));
}

 reset
 {
     return ((current.map == "menu") && (old.map != current.map));
 }