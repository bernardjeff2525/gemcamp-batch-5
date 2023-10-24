class AdminDomainConstraint
  def matches?(request)
    domains = ['admin.com', 'admin1.com', 'admin2.com']
    domains.include?(request.domain.downcase)
  end
end