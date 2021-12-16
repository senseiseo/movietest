class MovieDecorator < Draper::Decorator
  delegate_all

  def created_at_formatted 
    created_at.strftime('%Y-%m-%d %H:%M:%S')
  end

end
