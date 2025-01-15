(define (domain waypoint_following)

    (:requirements
        :typing
        :durative-actions
        )

    (:types
        waypoint
        robot
        object
        gripper
    )
    
    (:predicates
        (visited ?wp - waypoint)
        (robot-at ?v - robot ?wp - waypoint)
        (object-at ?obj - object ?wp - waypoint)
        (is_holding ?g - gripper ?obj - object)
        (free ?g - gripper)
    )
    
    (:durative-action move
        :parameters (?v - robot ?from ?to - waypoint)
        :duration ( = ?duration 20)
        :condition (and
            (at start (robot-at ?v ?from))
        )
        :effect (and
            (at end (visited ?to))
            (at end (robot-at ?v ?to))
            (at start(not
                (robot-at ?v ?from)
            ))
        )
    )

    
    (:durative-action pick
        :parameters (?v - robot ?wp - waypoint ?obj - object ?g - gripper)
        :duration (= ?duration 80)
        :condition (and
            (at start (and
                    (robot-at ?v ?wp)
                    (object-at ?obj ?wp)
                    (free ?g)
                    ))

	;; ADD YOUR CONDITIONS 


        )
        :effect (and 
        (at end (and
            (is_holding ?g ?obj)
            (not (free ?g))
            )
        )

	;; ADD YOUR EFFECTS

        )
    )

)