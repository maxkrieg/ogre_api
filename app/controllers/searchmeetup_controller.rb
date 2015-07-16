class SearchmeetupController < ApplicationController
  def search
    # results = RestClient.get 'https://api.meetup.com/find/groups?key=24234c5f7b46d447027576954f2f&sign=true&zip=90210&text=blueshoe'
    # results = RestClient.get 'https://api.meetup.com/find/groups', {:params => {:key => '24234c5f7b46d447027576954f2f', :sign => 'true', :zip => params[:zip], :text => params[:text], :page => params[:page], :radius => params[:radius]}}

    tmp_hash = params.except(:controller, :action, :format)
    tmp_hash = tmp_hash.merge(:key => '24234c5f7b46d447027576954f2f', :sign => 'true')

    meetup_hash = {:params => tmp_hash}

    results = RestClient.get 'https://api.meetup.com/find/groups', meetup_hash
    logger.debug "Got #{results.length} result"
    render json: results
  end
end
