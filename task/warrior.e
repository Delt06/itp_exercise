class
	WARRIOR

inherit
	MELEE_HERO

create
	make

feature
	set_healer(a_healer: detachable HEALER)
	require
		not_void: attached a_healer
	do
		healer := a_healer
	end

	remove_healer
	do
		healer := Void
	end

feature
	healer: detachable HEALER
end
