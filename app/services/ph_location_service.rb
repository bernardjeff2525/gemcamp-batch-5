class PhLocationService
  attr_reader :url

  def initialize
    @url = 'https://psgc.gitlab.io/api'
  end

  def fetch_regions
    request = RestClient.get("#{url}/regions/")
    region_data = JSON.parse(request.body)
    region_data.each do |region|
      address_region = Address::Region.find_or_initialize_by(code: region['code'])
      address_region.name = region['regionName']
      address_region.save
    end
  end

  def fetch_provinces
    request = RestClient.get("#{url}/provinces/")
    province_data = JSON.parse(request.body)
    province_data.each do |province|
      address_province = Address::Province.find_or_initialize_by(code: province['code'])
      address_province.region = Address::Region.find_by(code: province['regionCode'])
      address_province.name = province['name']
      address_province.save
    end
  end
end