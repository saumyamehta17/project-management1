class Search < ActiveRecord::Base
  attr_accessible :option_value, :keyword

  def results
  	results ||= find_result
  end

  
  def find_result
  	val = self.option_value

	  	if(val == "Project")
	  		results = Project.order(:name)
	  		results = results.where("name like ?", "#{keyword}%") unless keyword.blank?
	  		results

	  	elsif (val == "Workspace")
	  		results = Workspace.order(:name)
	  		results = results.where("name like ?", "#{keyword}%") unless keyword.blank?
	  		results
	  	else
	  		results = Task.order(:name)
	  		results = results.where("name like ?", "#{keyword}%") unless keyword.blank?
	  		results
	  			
  		end
  end
end
  			
