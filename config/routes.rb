Rails.application.routes.draw do
  get("/", {:controller => "calculator", :action => "go_home"})
  get("/:operation/new", {:controller => "calculator", :action => "new_op"})
  get("/:operation/results", {:controller => "calculator", :action => "op_results"})

end
