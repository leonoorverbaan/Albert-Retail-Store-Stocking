(define (problem albert-does-stuff)
    (:domain albert-does-stuff)
    (:requirements :strips :typing)

    (:objects   tiago - robot
                rightgrip - gripper
                wp0 wp_table_1 wp_table_2 cab_2_shelves cab_2_shelves_0 basket wp_table_3 wp_table_3_2 wp_table_3_3 - waypoint 
                AH_hagelslag_melk_tag36_11_00000 AH_hagelslag_melk_tag36_11_00001 AH_hagelslag_melk_tag36_11_00002 AH_hagelslag_melk_tag36_11_00003 AH_thee_mango_tag_11_00030 AH_thee_bosvruchten_tag36_11_00049 - object
		;; ADD YOUR WAYPOINTS AS IN THE CORRESPONDING .yaml FILE - waypoint
                ;; ADD YOUR OBJECTS AS IN THE CORRESPONDING .yaml FILE - object
    )
    (:init
    
	;; DEFINE YOUR INITIAL STATE
	(robot-at tiago wp0)
    (object-at AH_hagelslag_melk_tag36_11_00000 cab_2_shelves)
    (object-at AH_hagelslag_melk_tag36_11_00001 cab_2_shelves_0)
    (object-at AH_hagelslag_melk_tag36_11_00002 cab_2_shelves_0)
    (object-at AH_hagelslag_melk_tag36_11_00003 cab_2_shelves_0)
    (object-at AH_thee_mango_tag_11_00030 cab_2_shelves)
    (object-at AH_thee_bosvruchten_tag36_11_00049 cab_2_shelves)
    (free rightgrip)
    )
    
    (:goal (and
    ; (is_holding rightgrip april_tag_cube_23)
    ; (object-at april_tag_cube_23 wp_bin)
    ;(object_placed AH_hagelslag_mel_tag36_11_00000 basket)
    ;(object_placed AH_thee_mango_tag_11_00030 wp_table_2)
    ;(object_placed AH_thee_bosvruchten_tag36_11_00049 wp_table_2)

	;; DEFINE YOUR GOAL

	))

)


