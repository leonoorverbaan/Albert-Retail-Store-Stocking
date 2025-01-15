(define (problem albert_sim_submission)
    (:domain albert_sim_subm)
    (:requirements :strips :typing :numeric-fluents :durative-actions)

    (:objects   tiago - robot
                rightgrip - gripper
                wp0 wp_table_1 wp_table_2  wp_snack_robo wp_shelf_snack_1 wp_drink_robo wp_bin_robo wp_shelf_drink_1 wp_bin_1 - waypoint
                april_tag_cube_23 april_tag_cube_8 april_tag_cube_26 - object
                shelf_snack_1 - shelf_snack
                shelf_drink_1 - shelf_drink
                bin_1 - bin

    )
    (:init

        (= (bin_room bin_1) 10)
        (= (snack_room shelf_snack_1) 10)
        (= (drink_room shelf_drink_1) 10)
        (snack april_tag_cube_23)
        (drink april_tag_cube_8)
        (snack april_tag_cube_26)
        (expired april_tag_cube_26)
        (not-expired april_tag_cube_23)
        ;(expired april_tag_cube_23)
        (not-expired april_tag_cube_8)
        (heavy april_tag_cube_23)
        (heavy april_tag_cube_8)
        (heavy april_tag_cube_26)
        (visited wp0)
        (robot-at tiago wp0)
        ;(free leftgrip)
        (free rightgrip)
        (bin-at bin_1 wp_bin_robo)
        (shelfdrink-at shelf_drink_1 wp_drink_robo)
        (shelfsnack-at shelf_snack_1 wp_snack_robo)
        (object-at april_tag_cube_23 wp_table_1)
        (object-at april_tag_cube_8 wp_table_1)
        (object-at april_tag_cube_26 wp_table_2)
        (drinkspot wp_shelf_drink_1)
        (snackspot wp_shelf_snack_1)
        (binspot wp_bin_1)
    )
    
    (:goal (and
        (placed april_tag_cube_23)
        (placed april_tag_cube_8)
        (placed april_tag_cube_26)
	)

)

)
