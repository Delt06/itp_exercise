deferred class
	MELEE_HERO

inherit
	HERO

feature
	attack(target: HERO)
	do
		-- Current attacks
		print(get_name + " has dealt " + power.out + " damage to " + target.get_name + ".%N")

		if target.health > power then
			target.set_health(target.health - power)
		else
			target.set_health(0)
		end

		-- Target attacks
		if target.alive then
			print(target.get_name + " has dealt " + target.power.out + " damage to " + get_name + ".%N")

			if health > target.power then
				set_health(health - target.power)
			else
				set_health(0)
			end
		end
	end
end
