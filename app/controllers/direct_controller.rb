class DirectController < ApplicationController
  def organisation
    @organisation = Organisation.find_by slug: params[:organisation_slug]
    breadcrumb
    render 'organisations/show'
  end
  
  def archive
    @organisation = Organisation.find_by slug: params[:organisation_slug]
    @archive = @organisation.archives.find_by slug: params[:archive_slug]
    breadcrumb
    render 'archives/show'
  end

  def item
    @organisation = Organisation.find_by slug: params[:organisation_slug]
    @archive = @organisation.archives.find_by slug: params[:archive_slug]
    @item = @archive.items.find_by id: params[:item_id]
    breadcrumb
    render 'items/show'
  end

  protected

  def breadcrumb
    add_breadcrumb @organisation, direct_organisation_path(organisation_slug: @organisation.slug) if @organisation
    add_breadcrumb @archive, direct_archive_path(organisation_slug: @organisation.slug, archive_slug: @archive.slug) if @archive
    add_breadcrumb @item if @item
  end
end