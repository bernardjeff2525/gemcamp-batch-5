class RandomUserService
  attr_reader :url
  def initialize
    @url = 'https://randomuser.me/api/'
  end

  def random_user
    request = RestClient.get url
    JSON.parse(request.body)
  end
end