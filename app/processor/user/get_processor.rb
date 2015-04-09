class User::GetProcessor < ApplicationProcessor
  def input_setting
    {
      id: { required: true }
    }
  end

  def execute
    user_data.each do |user|
      return user if user[:id] == @params[:id]
    end
    nil
  end

  private

  def user_data
    [
      {
        id:   1,
        name: 'user1'
      },
      {
        id:   2,
        name: 'user2'
      }
    ]
  end
end
