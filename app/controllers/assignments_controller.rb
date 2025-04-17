class AssignmentsController < ApplicationController
  def assignreviewer
    render file: Rails.root.join('public', 'index.html'), layout: false
  end
end
