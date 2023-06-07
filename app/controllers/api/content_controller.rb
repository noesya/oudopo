class Api::ContentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sync
    @json = JSON.parse(request.raw_post)
    @access_key = @json['access_key']
    @secret = @json['secret']
    @data = @json['data']
    @archive = Archive.where(id: @access_key, secret: @secret).first
    if @archive.present?
      @archive.store @data
      render status: 200, json: 'ok'
    else
      raise exception
    end
  end

end