class DashboardController < ApplicationController
  def index
    @todo = YAML.load_file(Rails.root.join("todo_list.yml"))
  end
end
