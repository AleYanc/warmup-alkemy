class UsersRepresenter
  def initialize(users)
      @users = users
  end

  def as_json
      @users.map do |user|
          {
              id: user.id,
              user: user.email
          }
      end
  end

  private
  attr_reader :users
end