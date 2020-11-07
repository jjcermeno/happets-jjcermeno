module Searches
  class SearchesRepository

    def search_exists?(id)
      Search.where(id: id).first.present?
    end

    def get_search(id)
      get_searches(id).first
    end

    def get_searches(id)
      Search.where(id: id)
    end

    def create_search(dto)
      search              = Search.new
      search.search_type  = dto.search_type
      search.search_value = dto.search_value
      search.email        = dto.email
      search.save
      search
    end

    def show_search(id, params)
      search         = get_search(id)
      params[:objects] = get_jokes_paginated(id, params[:page], params[:per_page])
      Api::V1::SearchDetailedPresenter.new(search, params.dup)
    end

    def get_searches_page(page, per_page)
      Search.paginate(page: page, per_page: per_page)
    end

    def show_searches(searches)
      CollectionPresenter.new(
      searches,
      Api::V1::SearchPresenter
      )
    end

    def get_jokes_paginated(id, page, per_page)
      search = get_search(id)
      search.jokes.paginate(page: page, per_page: per_page).map { |joke| joke }

    end

    def total_searches
      Search.all.size
    end

  end
end