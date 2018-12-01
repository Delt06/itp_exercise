deferred class
	RANGED_HERO

inherit
	HERO
		rename
			attack as shoot
		end

feature
	shoot(target: HERO)
	do
		-- Current attack
		print(get_name + " has dealt " + power.out + " damage to " + target.get_name + ".%N")

		if target.health > power then
			target.set_health(target.health - power)
		else
			target.set_health(0)
		end
	end
end
