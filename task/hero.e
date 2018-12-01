deferred class
	HERO

feature
	health, power: INTEGER
	alive: BOOLEAN

feature
	make(a_power: INTEGER; a_name: STRING)
		-- Initalization
	require
		valid_power: a_power > 0
	do
		power := a_power
		create name.make_from_string (a_name)

		health := 100
		alive := True
	end

	attack(target: HERO)
		-- Current attacks target
	require
		current_isnt_target: Current /= target
		alive: alive
		target_alive: target.alive
	deferred
	end

feature
	get_name: STRING
		-- Returns the name of Current
	do
		create Result.make_from_string (name)
	end

feature {NONE}
	name: STRING

feature {HERO}
	set_health(a_health: INTEGER)
		-- Sets health to the stated value
	require
		alive
		0 <= a_health and a_health <= 100
	do
		health := a_health

		if health = 0 then
			alive := False
			print(name + " is dead.%N")
		end
	end

invariant
	valid_power: power > 0
	valid_health: 0 <= health and health <= 100
end
