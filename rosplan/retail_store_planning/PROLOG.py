from pyswip import Prolog

prolog = Prolog()
prolog.consult("KB.pl")

to_do = "place" # "place"

f = open("new_executor.bash", "a")
init_text = '''echo "Adding goals to the problem file"'''
f.write('\n' + init_text)

if to_do == "place":
    for soln in prolog.query("final_location(X,Y)"):
        print("item:", soln["X"], "waypoint:", soln["Y"])
        X = soln["X"]
        Y = soln["Y"]
        add_text = f'''

rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{{key: 'obj', value: '{X}'}}, {{key: 'wp', value: '{Y}'}}]"

          '''

        # print(add_text)
        # print("----")

        f.write('\n' + add_text)


if to_do == "sort":
    priority_order = []
    try:
        for soln in prolog.query("priority(X), priority_expiry(Y,X)"):
            print("item:", soln["X"], "waypoint:", soln["Y"])
            priority = soln["X"]
            item = soln["Y"]
            priority_order.append(item)
    except Exception as e:
        print("Got the expected exception. By this point, all goals should already have been added")


    for item in priority_order:
        add_text = f'''

rosservice call /rosplan_knowledge_base/update "update_type: 1
knowledge:
  knowledge_type: 1
  attribute_name: 'object_placed'
  values: [{{key: 'obj', value: '{item}'}}, {{key: 'wp', value: 'wp_table_3'}}]"
        '''


        # print(add_text)
        # print("----")
        f.write('\n' + add_text)


other_calls = '''
echo "Generating a Problem"
rosservice call /rosplan_problem_interface/problem_generation_server

echo "Planning"
rosservice call /rosplan_planner_interface/planning_server

echo "Executing the Plan"
rosservice call /rosplan_parsing_interface/parse_plan
rosservice call /rosplan_plan_dispatcher/dispatch_plan'''


f.write('\n' + other_calls)

