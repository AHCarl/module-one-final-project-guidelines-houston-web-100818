class NotFoundError < StandardError
attr_reader :message

def initialize(message, action)
  super(message)
  @action = action
end

end