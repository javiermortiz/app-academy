require 'active_support'
require 'active_support/core_ext'
require 'erb'
require_relative './session'
require 'byebug'

class ControllerBase
  attr_reader :req, :res, :params

  # Setup the controller
  def initialize(req, res)
    @req = req
    @res = res 
    @already_built_response = false 
  end

  # Helper method to alias @already_built_response
  def already_built_response?
    @already_built_response
  end

  def double_render_error
    raise "Rendering twice" if already_built_response?
  end 

  # Set the response status code and header
  def redirect_to(url)
      double_render_error
      @res.add_header('Location', url)
      @res.status = 302
      session.store_session(@res)
      @already_built_response = true
  end

  # Populate the response with content.
  # Set the response's content type to the given type.
  # Raise an error if the developer tries to double render.
  def render_content(content, content_type)
    #debugger
    double_render_error
    @res['Content-Type'] = content_type
    @res.write(content)
    session.store_session(@res)
    @already_built_response = true 
  end

  # use ERB and binding to evaluate templates
  # pass the rendered html to render_content
  def render(template_name)
    current_dir = File.dirname(__FILE__)
    controller_name = self.class.name.underscore
    contents = File.read("#{current_dir}/../views/#{controller_name}/#{template_name}.html.erb")
    template = ERB.new(contents).result(binding)     
    render_content(template, "text/html")
  end

  # contents =  "<h1>ALL THE CATS</h1>\n<pre><%= @cats.to_s %></pre>\n<a href=\"/cats/new\">New cat!</a>\n"
  # template = "<h1>ALL THE CATS</h1>\n<pre>[\"GIZMO\"]</pre>\n<a href=\"/cats/new\">New cat!</a>\n"

  # method exposing a `Session` object
  def session
    @session ||= Session.new(@req)
  end

  # use this with the router to call action_name (:index, :show, :create...)
  def invoke_action(name)
  end
end

