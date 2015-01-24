module Paginate
  def paginate(per_page, page)
    page = 0 
    Resource.limit(10).offset(page * 10)
    Resource.limit(10).offset(page * 10) do |relation_of_ten|
      do_something_with(relation_of_ten)
    end