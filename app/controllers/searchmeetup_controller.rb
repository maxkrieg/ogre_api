class SearchmeetupController < ApplicationController
  def search
    # 1 Removes these items from incoming params hash
    tmp_hash = params.except(:controller, :action, :format)

    # 2 Adds on meetup api key and sign params
    tmp_hash = tmp_hash.merge(:key => '24234c5f7b46d447027576954f2f', :sign => 'true')

    # 3 creates new params hash with these params to pass to REST client
    meetup_hash = {:params => tmp_hash}

    # 4 Makes request to meetup API, stores response in 'results' variable
    results = RestClient.get 'https://api.meetup.com/find/groups', meetup_hash
    logger.debug "Got #{results.length} result"

    # 5 Renders results array as JSON to front end
    render json: results
  end
end
