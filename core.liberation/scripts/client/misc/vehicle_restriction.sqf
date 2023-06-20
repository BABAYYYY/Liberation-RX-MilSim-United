HeliUnits= ["b_air","b_att_air"]; 
PlaneUnits= [ "b_plane_cas", "b_plane_cap", "b_plane_sead", "b_plane_multi", "b_plane", "b_plane_cargo"]; 
TankUnits= ["b_mech_inf", "b_armor", "b_art"]; 
 
player addEventHandler [  
	"GetInMan",   
	{  

		params ["_unit", "_role", "_vehicle", "_turret"]; 
//		systemChat format ["%1 - %2 ",_role, _turret];   Debug
		// if !(SNC_VehRestriction) exitwith{};	
		
		if (_role == "Cargo") exitwith {}; 
		if (_vehicle isKindof "ParachuteBase") exitwith {}; 
		private _GrpRol = group _unit getVariable ["BIS_dg_rol","b_unknown"];  
		

		/*if ((typeOf _vehicle in opfor_battlegroup_vehicles) || (typeOf _vehicle in opfor_vehicles)) then {
			_vehicle setVehicleAmmo 0; 
			hint "keine Ahnung wie man das Ding abfeuert...";
		};*/

		
		if (_vehicle isKindof "Helicopter") then { 
			_vehicle enableCopilot false;
			if (_role != "driver") exitwith {}; 
			if (typeOf _vehicle in transport_air_vehicles) then{ 
				if ( (SNC_VehRestriction && !(_GrpRol in HeliUnits)) || !([player,2] call fetch_permission) || (msu_slot_system && !(typeOf player == "B_helicrew_F")) ) then{ 
					_unit action ["getOut", _vehicle]; 
					hint format ["Missing slot, role or permission (transport heli)", name player];
				}; 
			}else{
				if ( (SNC_VehRestriction && !(_GrpRol in HeliUnits)) || !([player,2] call fetch_permission) || (msu_slot_system && !(typeOf player == "B_Helipilot_F")) ) then{ 
					_unit action ["getOut", _vehicle]; 
					hint format ["Missing slot, role or permission (attack heli)", name player];
				}; 
			}; 
		}; 

		if (_vehicle isKindof "Plane") then { 
			_vehicle enableCopilot false;
			if (_role != "driver") exitwith {}; 
			if (typeOf _vehicle in transport_air_vehicles) then{ 
				if ( (SNC_VehRestriction && !(_GrpRol in PlaneUnits)) || !([player,2] call fetch_permission) || (msu_slot_system && !(typeOf player == "B_helicrew_F")) ) then{ 
					_unit action ["getOut", _vehicle]; 
					hint format ["Missing slot, role or permission (transport plane)", name player];
				}; 
			}else{
				if ( (SNC_VehRestriction && !(_GrpRol in PlaneUnits)) || !([player,2] call fetch_permission) || (msu_slot_system && !(typeOf player == "B_Pilot_F")) ) then{ 
					_unit action ["getOut", _vehicle]; 
					hint format ["Missing slot, role or permission (attack plane)", name player];
				}; 
			}; 
		}; 

		if (_vehicle isKindof "Tank") then { 
			if ( (SNC_VehRestriction && !(_GrpRol in TankUnits)) || !([player,1] call fetch_permission) || (msu_slot_system && !(typeOf player == "B_crew_F")) ) then{ 
				_unit action ["getOut", _vehicle]; 
				hint format ["Missing slot, role or permission", name player];
			}; 
		}; 

		if (_vehicle isKindof "Car") then { 
			if (!([player,0] call fetch_permission)) then{ 
				_unit action ["getOut", _vehicle]; 
				hint format ["Missing slot, role or permission", name player];
			}; 
		};
	}  
];
