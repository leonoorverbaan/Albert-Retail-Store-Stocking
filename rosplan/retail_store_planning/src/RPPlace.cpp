#include "RPPlace.h"

#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <retail_store_planning/PlaceAction.h>


/* The implementation of RPPlace.h */
namespace KCL_rosplan {

	/* constructor */
	RPPlaceInterface::RPPlaceInterface(ros::NodeHandle &nh) : _nh(nh) {
		// perform setup
	}

	/* action dispatch callback */
	bool RPPlaceInterface::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {

		// The action implementation goes here.
        typedef actionlib::SimpleActionClient<retail_store_planning::PlaceAction> PlaceClient;
		PlaceClient ac("place_server", true);

        //wait for the action server to come up
        while(!ac.waitForServer(ros::Duration(5.0))){
            ROS_INFO("Waiting for the place action server to come up");
        }

		retail_store_planning::PlaceGoal goal;
		
		/* not applicable anymore
		// Get parameter to use or not use aruco markers
		bool use_aruco;
		_nh.getParam("/aruco/use_aruco", use_aruco);
		goal.use_aruco = use_aruco;

		std::map<std::string, double> april_tag;
		_nh.getParam("/objects/" + msg->parameters[2].value + "/april_tag", aruco);
		goal.goal_id = april_tag["id"];
		*/
		bool use_aruco = 0;
		if(!use_aruco){
			// Use KB info on objects if not using aruco markers
			
			// CHANGE THE FOLLOWING THREE  LINES TO GET PLACE POSITION FROM KB
			std::map<std::string, double> position, orientation;
			_nh.getParam("/objects/" + msg->parameters[2].value + "/position", position);
			_nh.getParam("/objects/"+ msg->parameters[2].value + "/orientation", orientation);
			// Coordinates in the config are given in 'global' frame
			//goal.goal.position.header.frame_id = "map"; 
			ROS_INFO_STREAM_ONCE("Output message check: " << msg->parameters[2].value) ;
			goal.goal.position.x = position["x"];
			goal.goal.position.y = position["y"];
			goal.goal.position.z = position["z"];
			goal.goal.orientation.x = orientation["x"];
			goal.goal.orientation.y = orientation["y"];
			goal.goal.orientation.z = orientation["z"];
			goal.goal.orientation.w = orientation["w"];
			
			std::cout << "X Y Z x y z w" << goal.goal.position.x << goal.goal.position.y << goal.goal.position.z << goal.goal.orientation.x << goal.goal.orientation.y << goal.goal.orientation.z << goal.goal.orientation.w << std::endl;
			
			goal.goal_id = 0;
			//goal.goal_id = april_tag["id"]

		}
		else{
			//goal.goal.position.header.frame_id = "map"; 

			std::map<std::string, double> position, orientation;
			_nh.getParam("/objects/" + msg->parameters[2].value + "/position", position);
			_nh.getParam("/objects/"+ msg->parameters[2].value + "/orientation", orientation);
			// Coordinates in the config are given in 'global' frame
			//goal.goal.position.header.frame_id = "map"; 
			ROS_INFO_STREAM_ONCE("Output message check: " << msg->parameters[2].value) ;
			goal.goal.position.x = position["x"];
			goal.goal.position.y = position["y"];
			goal.goal.position.z = position["z"];
			goal.goal.orientation.x = orientation["x"];
			goal.goal.orientation.y = orientation["y"];
			goal.goal.orientation.z = orientation["z"];
			goal.goal.orientation.w = orientation["w"];
			// If you wanted to use aruco_ids to place, you'd have to
			// get the desired id from somewhere (i.e. params, a message)
			// and fill it in here (and change the bool in line 40 above
			goal.goal_id = 0;
		}

		ac.sendGoal(goal);
        ac.waitForResult();

        if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
            ROS_INFO("Hooray, the object is placed!");
        else
            ROS_INFO("Albert failed to place the object for some reason...");

		// complete the action
		ROS_INFO("KCL: (%s) Place Action completing.", msg->name.c_str());
		return true;
	}

} // close namespace

	/*-------------*/
	/* Main method */
	/*-------------*/

	int main(int argc, char **argv) {

		ros::init(argc, argv, "rosplan_place_action", ros::init_options::AnonymousName);
		ros::NodeHandle nh("~");

		// create PDDL action subscriber
		KCL_rosplan::RPPlaceInterface rpti(nh);

		rpti.runActionInterface();

		return 0;
	}
