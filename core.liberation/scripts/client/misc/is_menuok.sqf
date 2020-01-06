params ["_vehicle"];
private _ret = false;

private _R3F_move = isNull R3F_LOG_joueur_deplace_objet;
private _alive = alive player;
private _onfoot = vehicle player == player;

if (_alive && _onfoot && _R3F_move) then {
	_ret = true;
};

if ( !isNil "_vehicle" ) then {
	if ( !alive _vehicle || !isNull ( _vehicle getVariable ["R3F_LOG_est_transporte_par", objNull]) ) then {
		_ret = false;
	};
};
_ret;
