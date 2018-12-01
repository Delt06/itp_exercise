class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE} -- Initialization
	make
		do
			task16
		end

	task1
		local
			w: WARRIOR
			a: ARCHER
			b: BATTLE_MAGE
			h: HEALER
			list: LIST[HERO]
		do
			create w.make (10, "W")
			create a.make (10, "A")
			create b.make (10, "B")
			create h.make (10, "H")

			create {LINKED_LIST[HERO]} list.make
			list.extend (w)
			list.extend (a)
			list.extend (b)
			list.extend (h)

			across
				list as hero
			loop
				print(hero.item.get_name + " ")
			end

		end

	task2
		local
			h: HEALER
			w: WARRIOR
		do
			create h.make (10, "HEALER")
			create w.make (50, "WARRIOR")

			w.attack (h)
			h.heal (h)
		end

	task3
		local
			h: HEALER
			w: WARRIOR
		do
			create {BATTLE_MAGE} h.make (1, "BM")
			create w.make (1, "W")

			h.cast(w)
		end

	task4
		local
			h: HEALER
		do
			create h.make (1, "H")

			h.set_health(120)
		end

	task5
		local
			a1, a2: ARCHER
			h1, h2: HERO
		do
			create a1.make (5, "A1")
			create a2.make (10, "A2")

			h1 := a1
			h2 := a2

			h1.shoot(h2)
		end

	task6
		local
			h1, h2: HERO
		do
			create {WARRIOR} h1.make (10, "WARRIOR")
			create {BATTLE_MAGE} h2.make (15, "BATTLE_MAGE")

			if attached {WARRIOR} h1 as w and attached {HEALER} h2 as h then
				w.set_healer (h)
			end

			h1.attack (h2)
		end

	task7
		local
			w1, w2, w3: WARRIOR
			h1, h2, h3: HEALER
		do
			create w1.make (5, "W1")
			create w2.make (7, "W2")
			create w3.make (9, "W3")

			create h1.make (5, "H1")
			create h2.make (7, "H2")
			create h3.make (9, "H3")

			w1.set_healer (h1)
			w2.set_healer (h2)
			w3.set_healer (h3)

			w2.set_healer (w3.healer)
			w3.remove_healer
			w1.set_healer (w3.healer)
		end

	task8
		local
			w1, w2, w3: WARRIOR
			h1, h2, h3: HEALER
		do
			create w1.make (5, "W1")
			create w2.make (7, "W2")
			create w3.make (9, "W3")

			create h1.make (5, "H1")
			create h2.make (7, "H2")
			create h3.make (9, "H3")

			w1.set_healer (h1)
			w2.set_healer (h2)
			w3.set_healer (h3)

			w2.set_healer (w1.healer)
			w1.set_healer (w2.healer)

			if attached w1.healer as h_1 and attached w2.healer as h_2 then
				h_1.heal(h_2)
			end

		end

	task9
		local
			h1, h2: HERO
		do
			create {BATTLE_MAGE} h1.make (10, "BM")
			create {HEALER} h2.make (10, "H")

			h1.attack (h2)
			h2.attack (h1)
		end

	task10
		local
			bm: BATTLE_MAGE
			w: WARRIOR
			a: ARCHER
		do
			create w.make (100, "WARRIOR")
			create bm.make (150, "MAGE")
			create a.make (50, "ARCHER")

			w.set_healer (bm)

			w.attack (bm)
			w.attack (a)
			bm.cast (w)
		end

	task11
		local
			w: WARRIOR
		do
			create w.make (0, "PASSIVE WARRIOR")

			print(w.get_name)
		end

	task12
		local
			warrior: HERO
			healer: HEALER
		do
			create {WARRIOR} warrior.make (10, "W")
			create healer.make (5, "H")

			warrior.set_healer(healer)

			healer.heal (warrior)

			warrior.remove_healer
		end

	task13
		local
			w: WARRIOR
			h: HEALER
		do
			create w.make (5, "W")
			create h.make (10, "H")

			w.set_healer (h)

			w.healer.heal (w)
		end

	task14
		local
			w: WARRIOR
			bm: BATTLE_MAGE
		do
			create w.make (120, "W")
			create bm.make (80, "BM")

			bm.cast (w)
			w.attack (bm)
			w.attack (bm)
		end

	task15
		local
			boss: HERO
			heroes: LINKED_LIST[HERO]
		do
			create {WARRIOR} boss.make (500, "BOSS")

			create heroes.make
			heroes.extend (create {WARRIOR}.make (50, "W"))
			heroes.extend (create {HEALER}.make (25, "H"))
			heroes.extend (create {ARCHER}.make (30, "A"))

			across
				heroes as h
			loop
				h.item.attack (boss)
			end
		end

	task16
		local
			w1, w2, w3, w4: WARRIOR
			h1, h2, h3, h4: HEALER
		do
			create w1.make (1, "W1")
			create w2.make (1, "W2")
			create w3.make (1, "W3")
			create w4.make (1, "W4")

			create h1.make (1, "H1")
			create h2.make (1, "H2")
			create h3.make (1, "H3")
			create h4.make (1, "H4")

			w1.set_healer (h1)
			w2.set_healer (h2)
			w3.set_healer (h3)
			w4.set_healer (h4)

			w3.set_healer (w4.healer)
			w4.remove_healer

			h1 := h4
			h2 := h4

			w2.set_healer (h2)

			w1.set_healer (w4.healer)

			if attached w1.healer as h then
				print(h.get_name + "%N")
			else
				print("Void")
			end
		end

end
