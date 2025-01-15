
echo "Adding goals to the problem file"


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00000'}, {key: 'wp', value: 'basket'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_thee_mango_tag_11_00030'}, {key: 'wp', value: 'wp_table_1'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_thee_bosvruchten_tag36_11_00049'}, {key: 'wp', value: 'wp_table_1'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00001'}, {key: 'wp', value: 'wp_table_2'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00002'}, {key: 'wp', value: 'wp_table_2'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00003'}, {key: 'wp', value: 'wp_table_2'}]"

          

echo "Generating a Problem"
rosservice call /rosplan_problem_interface/problem_generation_server

echo "Planning"
rosservice call /rosplan_planner_interface/planning_server

echo "Executing the Plan"
rosservice call /rosplan_parsing_interface/parse_plan
rosservice call /rosplan_plan_dispatcher/dispatch_plan
echo "Adding goals to the problem file"


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00000'}, {key: 'wp', value: 'basket'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_thee_mango_tag_11_00030'}, {key: 'wp', value: 'wp_table_1'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_thee_bosvruchten_tag36_11_00049'}, {key: 'wp', value: 'wp_table_1'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00001'}, {key: 'wp', value: 'wp_table_2'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00002'}, {key: 'wp', value: 'wp_table_2'}]"

          


rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{key: 'obj', value: 'AH_hagelslag_melk_tag36_11_00003'}, {key: 'wp', value: 'wp_table_2'}]"

          

echo "Generating a Problem"
rosservice call /rosplan_problem_interface/problem_generation_server

echo "Planning"
rosservice call /rosplan_planner_interface/planning_server

echo "Executing the Plan"
rosservice call /rosplan_parsing_interface/parse_plan
rosservice call /rosplan_plan_dispatcher/dispatch_plan