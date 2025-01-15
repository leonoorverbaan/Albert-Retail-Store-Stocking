(define (problem object_pick_place)
    (:domain waypoint_following)
    (:requirements :strips :typing)

    (:objects   tiago - robot
                leftgrip rightgrip - gripper
                wp0 HS_place_location cab_2_shelves basket - waypoint
                AH_hagelslag_mel_tag36_11_00000 - object
		;; ADD YOUR WAYPOINTS AS IN THE CORRESPONDING .yaml FILE - waypoint
                ;; ADD YOUR OBJECTS AS IN THE CORRESPONDING .yaml FILE - object

    )
    (:init
        
	;; DEFINE YOUR INITIAL STATE
        (visited wp0)
        (robot-at tiago wp0)
        (free leftgrip)
        (free rightgrip)
        (object-at AH_hagelslag_mel_tag36_11_00000 cab_2_shelves)
    )
    
    (:goal (and
        ;;(object-at AH_hagelslag_mel_tag36_11_00000 HS_place_location)
        (placed AH_hagelslag_mel_tag36_11_00000 basket HS_place_location)
	)

)

)
