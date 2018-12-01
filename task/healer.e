class
	HEALER

inherit
	HERO
		rename
			attack as heal
		end

create
	make

feature
	heal(target: HERO)
		-- Current heals target
	do
		if target.health + power <= 100 then
			target.set_health (target.health + power)
		else
			target.set_health (100)
		end

		print(get_name + " has healed " + target.get_name + " for " + power.out + ".%N")
		print(target.get_name + "'s health is " + target.health.out + "%N")
	end

end
