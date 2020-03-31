// View the full problem and run the test cases at:
//  https://leetcode.com/problems/course-schedule/
function createGraph(list) {
    let graph = {};

    list.forEach(pair => {
        let [ course, pre ] = pair.map(String);

        if (course in graph) {
            graph[course].push(pre);
        } else {
            graph[course] = [ pre ];
        }

        if (!(pre in graph)) {
            graph[pre] = [];
        }
    })

    return graph;
}


function canFinish(numCourses, prerequisites) {
    let prereq = createGraph(prerequisites);
    let completed = new Set();
    let coursesAvailable = true;

    while (coursesAvailable) {
        coursesAvailable = false;

        for (let course in prereq) {
            let openCourse = prereq[course].every(pre => completed.has(pre));
            if (!completed.has(course) && openCourse) {
                completed.add(course);
                coursesAvailable = true;
            }
        }
    }
    
    return completed.size() === Object.keys(prereq).length;
}
