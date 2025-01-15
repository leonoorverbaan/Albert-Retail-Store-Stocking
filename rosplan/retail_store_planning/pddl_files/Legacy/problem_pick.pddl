(define (problem waypoint_following)
    (:domain waypoint_following)
    (:requirements :strips :typing)

    (:objects   tiago - robot
                leftgrip rightgrip - gripper
                wp0 cab_2_shelves - waypoint
                AH_hagelslag_mel_tag36_11_00000  - object
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
        (is_holding rightgrip AH_hagelslag_mel_tag36_11_00000)
        ;;(not (free rightgrip))
	)

)

)
