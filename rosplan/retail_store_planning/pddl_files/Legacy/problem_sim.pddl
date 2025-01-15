(define (problem albert_sim_problem)
    (:domain albert_sim_final)
    (:requirements :strips :typing :numeric-fluents :durative-actions)

    (:objects   tiago - robot
                rightgrip - gripper
                wp0 wp_table_1 wp_table_2 cab_2_shelves basket - waypoint
                AH_hagelslag_mel_tag36_11_00000 AH_thee_mango_tag_11_00030 AH_thee_bosvruchten_tag36_11_00049 - object
                shelf_snack_1 - shelf_snack
                shelf_drink_1 - shelf_drink
                bin_1 - bin

    )
    (:init

        (= (bin_room bin_1) 10)
        (= (snack_room shelf_snack_1) 10)
        (= (drink_room shelf_drink_1) 10)
        (snack AH_hagelslag_mel_tag36_11_00000)
        (drink AH_thee_mango_tag_11_00030)
        (snack AH_thee_bosvruchten_tag36_11_00049)
        (expired AH_thee_bosvruchten_tag36_11_00049)
        (not-expired AH_hagelslag_mel_tag36_11_00000)
        ;(expired april_tag_cube_23)
        (not-expired AH_thee_mango_tag_11_00030)
        (heavy AH_hagelslag_mel_tag36_11_00000)
        (heavy AH_thee_mango_tag_11_00030)
        (heavy AH_thee_bosvruchten_tag36_11_00049)
        (visited wp0)
        (robot-at tiago wp0)
        ;(free leftgrip)
        (free rightgrip)
        ;(bin-at bin_1 wp_bin_robo)
        ;(shelfdrink-at shelf_drink_1 wp_drink_robo)
        ;(shelfsnack-at shelf_snack_1 wp_snack_robo)
        (object-at AH_hagelslag_mel_tag36_11_00000 cab_2_shelves)
        (object-at AH_thee_mango_tag_11_00030 cab_2_shelves)
        (object-at AH_thee_bosvruchten_tag36_11_00049 cab_2_shelves)
        (drinkspot wp_table_1)
        (snackspot wp_table_2)
        (binspot basket)
    )
    
    (:goal (and
        (placed AH_hagelslag_mel_tag36_11_00000)
        (placed AH_thee_mango_tag_11_00030)
        (placed AH_thee_bosvruchten_tag36_11_00049)
	)

)

)
