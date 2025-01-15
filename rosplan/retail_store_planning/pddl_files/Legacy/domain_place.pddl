(define (domain object_pick_place)

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
        (placed ?obj - object ?wp - waypoint  ?wp_goal - waypoint)
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
        :duration (= ?duration 20)
        :condition (and
            (over all (robot-at ?v ?wp))
            (at start (object-at ?obj ?wp))
            (at start (free ?g))


        )
        :effect (and 
        (at end (and
            (is_holding ?g ?obj)
            (not (free ?g))
            (not (object-at ?obj ?wp))
            )
        )

	;; ADD YOUR EFFECTS

        )
    )

    (:durative-action place
        :parameters (?v - robot ?wp ?wp_goal - waypoint ?obj - object ?g - gripper) 
        :duration (= ?duration 20)
        :condition (and
            (over all (robot-at ?v ?wp))
            (at start (is_holding ?g ?obj))


        )
        :effect (and 
        (at end (and
            ;;(robot-at ?v ?wp)
            (object-at ?obj ?wp_goal)
            (not (is_holding ?g ?obj))
            (placed ?obj ?wp ?wp_goal)
            (free ?g)
            )
        )

	;; ADD YOUR EFFECTS

        )
    )

)