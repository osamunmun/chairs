require 'clockwork'
include Clockwork

handler do |job|
  case job
  when "chair"
    `rake sq:chair`
  when "clean"
    `rake sq:clean`
  end
end

every(3.minutes,'chair')
every(1.days,'clean', :at => '00:00')
