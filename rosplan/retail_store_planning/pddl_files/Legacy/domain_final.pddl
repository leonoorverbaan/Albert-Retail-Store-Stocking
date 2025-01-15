(define (domain albert_sim_final)

    (:requirements
        :typing
        :durative-actions
        :conditional-effects
        :disjunctive-preconditions
        :negative-preconditions
        :fluents
        )

    (:types
        waypoint
        robot
        bin
        object
        gripper
        shelf_snack
        shelf_drink
    )
    
    (:predicates
        (visited ?wp - waypoint)
        (robot-at ?v - robot ?wp - waypoint)
        (object-at ?obj - object ?wp - waypoint)
        (placed ?obj - object)
        (is_holding ?g - gripper ?obj - object)
        (free ?g - gripper)
        (expired ?obj - object)
        (not-expired ?obj - object)
        (empty ?obj - object)
        (heavy ?obj - object)
        (snack ?obj - object)
        (drink ?obj - object)
        (bin-at ?b - bin ?wp_bin - waypoint)
        (shelfdrink-at ?sd - shelf_drink ?wp_shelf_drink - waypoint)
        (shelfsnack-at ?ss - shelf_snack ?wp_shelf_snack - waypoint)
        (drinkspot ?wp - waypoint)
        (snackspot ?wp - waypoint)
        (binspot ?wp - waypoint)
    )
    
    (:functions
        (bin_room ?b - bin)
        (snack_room ?ss - shelf_snack)
        (drink_room ?sd - shelf_drink)
    )

    (:durative-action move
        :parameters (?v - robot ?from ?to - waypoint)
        :duration ( = ?duration 40)
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
        :duration (= ?duration 50)
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