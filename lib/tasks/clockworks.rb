require 'clockwork'
include Clockwork

handler do |job|
  case job
  when "chair"
    `rake sq:chair`
  end
end

every(10.minutes,'chair')
