class DirectController < ApplicationController
  def organisation
    @organisation = Organisation.find_by slug: params[:organisation_slug]
    add_breadcrumb @organisation
    render 'organisations/show'
  end
  
  def archive
    @organisation = Organisation.find_by slug: params[:organisation_slug]
    @archive = @organisation.archives.find_by slug: params[:archive_slug]
    add_breadcrumb @organisation, direct_organisation_path(@organisation)
    add_breadcrumb @archive
    render 'archives/show'
  end
end