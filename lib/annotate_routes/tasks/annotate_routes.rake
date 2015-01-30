namespace :annotate_routes do
  task :run => [:environment, :setup] do
    routes_stream = capture(:stdout) { Rake::Task['routes'].invoke }
    inspector = AnnotateRoutes::Inspector.new(routes_stream)
    inspector.routes.each do |route|
      begin
        AnnotateRoutes::Annotator.new(Rails.root, route).annotate!
        puts "#{route[:reqs]} written"
      rescue => e
        puts e.message
      end
    end
  end

  task :setup do
    require 'annotate_routes/annotator'
    require 'annotate_routes/inspector'
  end
end

desc 'Annotate routes'
task :annotate_routes => 'annotate_routes:run'
