class User
  attr_reader :name, :versions

  def initialize(name)
    @name = name
    @versions = []
  end

  def store_version(version)
    @versions << version
  end

  def highest_logged_version
    @versions.max
  end
end

# UserVersionAnalyser to analyse user versions and identify the target version
class UserVersionAnalyser
  def initialize(target_version)
    @target_version = target_version
    @users = {}
  end

  # Process the log lines to generate user objects with versions
  def process(log_lines)
    log_lines.each do |line|
      parts = line.split(' ')
      user = parts[0].split('=')[1]
      version = parts[1].split('=')[1].to_i

      # Create or retrieve user object and add version
      @users[user] ||= User.new(user)
      @users[user].store_version(version)
    end
  end

  # Displaying the names of user with the target version
  def execute
    @users.each do |user, user_obj|
      if user_obj.highest_logged_version == @target_version
        puts user
      end
    end
  end
end

# get_users_with_version Function
def get_users_with_version(log_lines, target_version)
  analyser = UserVersionAnalyser.new(target_version)
  analyser.process(log_lines)
  analyser.execute
end

# Example call with sample log lines, update your log lines here
log_lines = [
  "user=alice version=1",
  "user=alice version=2",
  "user=bob version=3",
  "user=bob version=4",
  "user=alice version=3",
  "user=john version=3"
]

# Call the function to fetch the result
get_users_with_version(log_lines, 3)
