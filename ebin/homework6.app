{application, homework6,
 [
     {description, "Homework 6 caching application"},
     {vsn, "1.0"},
     {modules, [homework6_app, homework6_sup, homework6_server, homework6_test, homework6]},
     {registered, [homework6_server]},
     {applications, [kernel, stdlib]},
     {mod, {homework6_app, []}},
     {env, []}
 ]}.
