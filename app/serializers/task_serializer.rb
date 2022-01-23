class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :completed, :due, :label_id, :user_id
end
